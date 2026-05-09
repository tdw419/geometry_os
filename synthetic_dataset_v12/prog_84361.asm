; DESCRIPTION: Renders a purple box of size 56x33 starting at (6, 152).
; PLAN: r0=6(x), r1=152(y), r2=56(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 152
LDI r2, 56
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
