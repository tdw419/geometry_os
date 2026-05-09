; DESCRIPTION: Renders a green box of size 88x12 starting at (388, 177).
; PLAN: r0=388(x), r1=177(y), r2=88(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 177
LDI r2, 88
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
