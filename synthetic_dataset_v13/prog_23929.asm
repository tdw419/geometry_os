; DESCRIPTION: Renders a blue box of size 87x104 starting at (180, 103).
; PLAN: r0=180(x), r1=103(y), r2=87(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 103
LDI r2, 87
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
