; DESCRIPTION: Composite: Renders a purple box of size 19x91 starting at (45, 50) then Renders a orange disk with center (404, 164) and radius 41.
; PLAN: r0=45(x), r1=50(y), r2=19(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=164(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 50
LDI r2, 19
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 164
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
