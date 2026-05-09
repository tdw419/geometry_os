; DESCRIPTION: Composite: Draws a cyan line from (334, 238) to (150, 20) then Draws a magenta circle centered at (344, 113) with radius 10.
; PLAN: r0=334(x1), r1=238(y1), r2=150(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=113(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 238
LDI r2, 150
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 113
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
