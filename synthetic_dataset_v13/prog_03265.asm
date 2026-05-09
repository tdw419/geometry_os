; DESCRIPTION: Renders a purple box of size 20x39 starting at (206, 98).
; PLAN: r0=206(x), r1=98(y), r2=20(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 98
LDI r2, 20
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
