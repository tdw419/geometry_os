; DESCRIPTION: Composite: Places a yellow circle of radius 18 at center (409, 96) then Places a blue line segment connecting (277, 125) to (388, 166) then Places a red dot at position (60, 167).
; PLAN: r0=409(x), r1=96(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x1), r6=125(y1), r7=388(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=167(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 96
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 125
LDI r7, 388
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 167
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
