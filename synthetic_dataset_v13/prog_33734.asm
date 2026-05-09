; DESCRIPTION: Composite: Renders a white box of size 60x98 starting at (229, 58) then Places a magenta circle of radius 70 at center (432, 131).
; PLAN: r0=229(x), r1=58(y), r2=60(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=131(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 58
LDI r2, 60
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 131
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
