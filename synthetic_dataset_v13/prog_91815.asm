; DESCRIPTION: Renders a blue box of size 89x36 starting at (365, 199).
; PLAN: r0=365(x), r1=199(y), r2=89(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 199
LDI r2, 89
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
