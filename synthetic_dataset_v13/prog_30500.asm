; DESCRIPTION: Renders a white box of size 106x28 starting at (336, 177).
; PLAN: r0=336(x), r1=177(y), r2=106(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 177
LDI r2, 106
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
