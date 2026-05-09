; DESCRIPTION: Renders a purple box of size 98x19 starting at (237, 220).
; PLAN: r0=237(x), r1=220(y), r2=98(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 220
LDI r2, 98
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
