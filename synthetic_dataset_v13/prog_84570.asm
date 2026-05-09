; DESCRIPTION: Renders a cyan box of size 114x82 starting at (74, 43).
; PLAN: r0=74(x), r1=43(y), r2=114(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 43
LDI r2, 114
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
