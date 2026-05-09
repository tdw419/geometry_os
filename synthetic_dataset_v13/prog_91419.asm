; DESCRIPTION: Renders a white box of size 32x94 starting at (377, 91).
; PLAN: r0=377(x), r1=91(y), r2=32(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 91
LDI r2, 32
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
