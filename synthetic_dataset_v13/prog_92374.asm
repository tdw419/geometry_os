; DESCRIPTION: Renders a purple box of size 109x95 starting at (70, 133).
; PLAN: r0=70(x), r1=133(y), r2=109(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 133
LDI r2, 109
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
