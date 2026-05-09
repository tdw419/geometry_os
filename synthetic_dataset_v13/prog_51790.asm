; DESCRIPTION: Renders a white box of size 95x35 starting at (280, 2).
; PLAN: r0=280(x), r1=2(y), r2=95(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 2
LDI r2, 95
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
