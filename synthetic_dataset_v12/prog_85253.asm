; DESCRIPTION: Composite: Renders a cyan box of size 100x104 starting at (302, 41) then Places a green circle of radius 17 at center (400, 112).
; PLAN: r0=302(x), r1=41(y), r2=100(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=112(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 302
LDI r1, 41
LDI r2, 100
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 112
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
