; DESCRIPTION: Renders a purple box of size 12x88 starting at (443, 152).
; PLAN: r0=443(x), r1=152(y), r2=12(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 152
LDI r2, 12
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
