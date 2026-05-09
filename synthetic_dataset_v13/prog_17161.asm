; DESCRIPTION: Renders a white box of size 68x43 starting at (308, 35).
; PLAN: r0=308(x), r1=35(y), r2=68(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 35
LDI r2, 68
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
