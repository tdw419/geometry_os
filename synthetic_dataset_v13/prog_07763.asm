; DESCRIPTION: Renders a purple box of size 13x55 starting at (307, 150).
; PLAN: r0=307(x), r1=150(y), r2=13(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 150
LDI r2, 13
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
