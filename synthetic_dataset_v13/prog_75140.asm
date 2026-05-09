; DESCRIPTION: Composite: Renders a black box of size 113x55 starting at (62, 112) then Places a red circle of radius 25 at center (245, 52).
; PLAN: r0=62(x), r1=112(y), r2=113(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=52(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 112
LDI r2, 113
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 52
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
