; DESCRIPTION: Renders a purple box of size 102x68 starting at (127, 14).
; PLAN: r0=127(x), r1=14(y), r2=102(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 14
LDI r2, 102
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
