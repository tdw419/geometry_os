; DESCRIPTION: Renders a blue box of size 60x52 starting at (374, 79).
; PLAN: r0=374(x), r1=79(y), r2=60(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 79
LDI r2, 60
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
