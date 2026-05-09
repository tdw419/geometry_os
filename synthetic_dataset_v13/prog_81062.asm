; DESCRIPTION: Composite: Creates a yellow circular shape at (329, 109) with radius 44 then Sets a single cyan pixel at (140, 170) then Draws a blue line from (480, 179) to (255, 187).
; PLAN: r0=329(x), r1=109(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=170(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=179(y1), r12=255(x2), r13=187(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 109
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 170
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 480
LDI r11, 179
LDI r12, 255
LDI r13, 187
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
