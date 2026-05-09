; DESCRIPTION: Renders a purple box of size 70x28 starting at (325, 174).
; PLAN: r0=325(x), r1=174(y), r2=70(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 174
LDI r2, 70
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
