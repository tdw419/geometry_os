; DESCRIPTION: Renders a blue box of size 86x60 starting at (124, 133).
; PLAN: r0=124(x), r1=133(y), r2=86(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 133
LDI r2, 86
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
