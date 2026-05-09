; DESCRIPTION: Renders a red box of size 77x37 starting at (396, 103).
; PLAN: r0=396(x), r1=103(y), r2=77(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 103
LDI r2, 77
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
