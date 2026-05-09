; DESCRIPTION: Renders a white box of size 106x50 starting at (84, 61).
; PLAN: r0=84(x), r1=61(y), r2=106(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 61
LDI r2, 106
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
