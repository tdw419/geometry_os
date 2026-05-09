; DESCRIPTION: Renders a white box of size 111x106 starting at (182, 87).
; PLAN: r0=182(x), r1=87(y), r2=111(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 87
LDI r2, 111
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
