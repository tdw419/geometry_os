; DESCRIPTION: Composite: Draws a cyan line from (399, 123) to (216, 203) then Places a magenta circle of radius 60 at center (73, 77) then Sets a single green pixel at (102, 221).
; PLAN: r0=399(x1), r1=123(y1), r2=216(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=77(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=221(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 123
LDI r2, 216
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 77
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 221
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
