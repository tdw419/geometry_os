; DESCRIPTION: Renders a purple box of size 98x56 starting at (152, 133).
; PLAN: r0=152(x), r1=133(y), r2=98(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 98
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
