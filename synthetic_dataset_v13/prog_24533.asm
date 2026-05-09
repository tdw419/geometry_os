; DESCRIPTION: Renders a white box of size 120x116 starting at (308, 137).
; PLAN: r0=308(x), r1=137(y), r2=120(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 137
LDI r2, 120
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
