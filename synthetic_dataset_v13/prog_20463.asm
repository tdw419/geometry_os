; DESCRIPTION: Renders a blue box of size 87x79 starting at (107, 166).
; PLAN: r0=107(x), r1=166(y), r2=87(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 166
LDI r2, 87
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
