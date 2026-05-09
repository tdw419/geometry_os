; DESCRIPTION: Renders a white box of size 99x66 starting at (14, 36).
; PLAN: r0=14(x), r1=36(y), r2=99(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 36
LDI r2, 99
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
