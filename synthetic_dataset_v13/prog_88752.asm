; DESCRIPTION: Renders a blue box of size 79x44 starting at (328, 152).
; PLAN: r0=328(x), r1=152(y), r2=79(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 152
LDI r2, 79
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
