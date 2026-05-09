; DESCRIPTION: Composite: Renders a red box of size 10x106 starting at (121, 40) then Places a orange dot at position (482, 246).
; PLAN: r0=121(x), r1=40(y), r2=10(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=246(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 40
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 246
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
