; DESCRIPTION: Composite: Renders a magenta box of size 71x41 starting at (67, 81) then Places a cyan dot at position (233, 19).
; PLAN: r0=67(x), r1=81(y), r2=71(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 67
LDI r1, 81
LDI r2, 71
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
