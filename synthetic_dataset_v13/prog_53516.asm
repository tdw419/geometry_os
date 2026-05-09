; DESCRIPTION: Renders a white box of size 86x65 starting at (308, 153).
; PLAN: r0=308(x), r1=153(y), r2=86(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 153
LDI r2, 86
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
