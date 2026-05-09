; DESCRIPTION: Composite: Draws a magenta circle centered at (118, 125) with radius 74 then Places a cyan line segment connecting (398, 153) to (375, 94).
; PLAN: r0=118(x), r1=125(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=153(y1), r7=375(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 125
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 153
LDI r7, 375
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
