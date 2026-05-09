; DESCRIPTION: Composite: Renders a red box of size 93x119 starting at (271, 91) then Places a red dot at position (210, 101).
; PLAN: r0=271(x), r1=91(y), r2=93(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 91
LDI r2, 93
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
