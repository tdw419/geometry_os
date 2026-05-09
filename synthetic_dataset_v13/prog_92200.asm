; DESCRIPTION: Renders a blue box of size 79x19 starting at (206, 96).
; PLAN: r0=206(x), r1=96(y), r2=79(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 96
LDI r2, 79
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
