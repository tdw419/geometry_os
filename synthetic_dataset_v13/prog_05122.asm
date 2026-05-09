; DESCRIPTION: Renders a purple box of size 68x97 starting at (268, 126).
; PLAN: r0=268(x), r1=126(y), r2=68(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 126
LDI r2, 68
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
