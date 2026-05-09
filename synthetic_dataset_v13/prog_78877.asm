; DESCRIPTION: Renders a purple box of size 72x59 starting at (85, 180).
; PLAN: r0=85(x), r1=180(y), r2=72(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 180
LDI r2, 72
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
