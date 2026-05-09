; DESCRIPTION: Renders a purple box of size 74x82 starting at (380, 164).
; PLAN: r0=380(x), r1=164(y), r2=74(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 164
LDI r2, 74
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
