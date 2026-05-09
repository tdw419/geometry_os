; DESCRIPTION: Renders a blue box of size 86x80 starting at (228, 133).
; PLAN: r0=228(x), r1=133(y), r2=86(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 133
LDI r2, 86
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
