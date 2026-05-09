; DESCRIPTION: Renders a purple box of size 46x70 starting at (217, 61).
; PLAN: r0=217(x), r1=61(y), r2=46(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 61
LDI r2, 46
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
