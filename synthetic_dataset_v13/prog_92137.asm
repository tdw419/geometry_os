; DESCRIPTION: Renders a white box of size 15x19 starting at (242, 116).
; PLAN: r0=242(x), r1=116(y), r2=15(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 116
LDI r2, 15
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
