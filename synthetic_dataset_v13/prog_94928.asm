; DESCRIPTION: Renders a blue box of size 113x79 starting at (379, 109).
; PLAN: r0=379(x), r1=109(y), r2=113(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 109
LDI r2, 113
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
