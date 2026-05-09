; DESCRIPTION: Composite: Sets a single white pixel at (208, 249) then Places a magenta line segment connecting (146, 139) to (461, 0) then Places a magenta circle of radius 37 at center (383, 218).
; PLAN: r0=208(x), r1=249(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=139(y1), r7=461(x2), r8=0(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=218(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 249
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 139
LDI r7, 461
LDI r8, 0
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 218
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
