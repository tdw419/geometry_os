; DESCRIPTION: Renders a purple box of size 25x68 starting at (465, 73).
; PLAN: r0=465(x), r1=73(y), r2=25(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 73
LDI r2, 25
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
