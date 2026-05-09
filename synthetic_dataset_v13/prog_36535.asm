; DESCRIPTION: Renders a white box of size 45x77 starting at (396, 60).
; PLAN: r0=396(x), r1=60(y), r2=45(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 60
LDI r2, 45
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
