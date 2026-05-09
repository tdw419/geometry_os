; DESCRIPTION: Renders a blue box of size 92x79 starting at (85, 164).
; PLAN: r0=85(x), r1=164(y), r2=92(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 164
LDI r2, 92
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
