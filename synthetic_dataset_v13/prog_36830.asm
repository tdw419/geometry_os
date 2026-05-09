; DESCRIPTION: Renders a black box of size 85x57 starting at (380, 159).
; PLAN: r0=380(x), r1=159(y), r2=85(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 159
LDI r2, 85
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
