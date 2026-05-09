; DESCRIPTION: Renders a green box of size 87x61 starting at (112, 104).
; PLAN: r0=112(x), r1=104(y), r2=87(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 104
LDI r2, 87
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
