; DESCRIPTION: Renders a blue box of size 57x12 starting at (385, 180).
; PLAN: r0=385(x), r1=180(y), r2=57(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 180
LDI r2, 57
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
