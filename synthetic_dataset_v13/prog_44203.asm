; DESCRIPTION: Composite: Renders a cyan box of size 106x103 starting at (299, 86) then Places a black circle of radius 41 at center (443, 182).
; PLAN: r0=299(x), r1=86(y), r2=106(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=182(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 86
LDI r2, 106
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 182
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
