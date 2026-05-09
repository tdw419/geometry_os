; DESCRIPTION: Renders a white box of size 95x30 starting at (289, 177).
; PLAN: r0=289(x), r1=177(y), r2=95(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 177
LDI r2, 95
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
