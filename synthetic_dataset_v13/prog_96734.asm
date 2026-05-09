; DESCRIPTION: Renders a purple box of size 81x39 starting at (307, 161).
; PLAN: r0=307(x), r1=161(y), r2=81(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 161
LDI r2, 81
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
