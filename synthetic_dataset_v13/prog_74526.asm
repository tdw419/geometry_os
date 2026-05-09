; DESCRIPTION: Renders a blue box of size 99x97 starting at (330, 126).
; PLAN: r0=330(x), r1=126(y), r2=99(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 126
LDI r2, 99
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
