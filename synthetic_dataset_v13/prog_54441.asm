; DESCRIPTION: Renders a purple box of size 103x50 starting at (63, 63).
; PLAN: r0=63(x), r1=63(y), r2=103(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 63
LDI r2, 103
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
