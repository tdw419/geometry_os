; DESCRIPTION: Composite: Places a magenta circle of radius 29 at center (285, 177) then Draws a orange line from (475, 251) to (360, 37) then Sets a single cyan pixel at (401, 20).
; PLAN: r0=285(x), r1=177(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x1), r6=251(y1), r7=360(x2), r8=37(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=20(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 177
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 251
LDI r7, 360
LDI r8, 37
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 20
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
