; DESCRIPTION: Renders a purple box of size 70x99 starting at (392, 116).
; PLAN: r0=392(x), r1=116(y), r2=70(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 116
LDI r2, 70
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
