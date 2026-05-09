; DESCRIPTION: Renders a white box of size 63x94 starting at (25, 120).
; PLAN: r0=25(x), r1=120(y), r2=63(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 120
LDI r2, 63
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
