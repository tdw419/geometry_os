; DESCRIPTION: Renders a white box of size 63x10 starting at (334, 168).
; PLAN: r0=334(x), r1=168(y), r2=63(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 168
LDI r2, 63
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
