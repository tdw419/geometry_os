; DESCRIPTION: Renders a white box of size 99x96 starting at (123, 23).
; PLAN: r0=123(x), r1=23(y), r2=99(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 23
LDI r2, 99
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
