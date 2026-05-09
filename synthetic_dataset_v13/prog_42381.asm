; DESCRIPTION: Renders a white box of size 106x102 starting at (355, 56).
; PLAN: r0=355(x), r1=56(y), r2=106(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 56
LDI r2, 106
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
