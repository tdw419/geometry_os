; DESCRIPTION: Renders a blue box of size 76x34 starting at (365, 145).
; PLAN: r0=365(x), r1=145(y), r2=76(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 145
LDI r2, 76
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
