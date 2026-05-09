; DESCRIPTION: Composite: Creates a cyan circular shape at (277, 64) with radius 47 then Sets a single orange pixel at (455, 175) then Draws a green line from (63, 60) to (234, 10).
; PLAN: r0=277(x), r1=64(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=175(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=63(x1), r11=60(y1), r12=234(x2), r13=10(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 64
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 175
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 63
LDI r11, 60
LDI r12, 234
LDI r13, 10
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
