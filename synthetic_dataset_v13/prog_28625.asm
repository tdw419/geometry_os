; DESCRIPTION: Composite: Creates a red circular shape at (134, 213) with radius 31 then Renders a blue box of size 60x41 starting at (377, 137).
; PLAN: r0=134(x), r1=213(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=137(y), r7=60(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 213
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 137
LDI r7, 60
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
