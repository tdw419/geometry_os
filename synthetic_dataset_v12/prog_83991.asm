; DESCRIPTION: Renders a green box of size 71x97 starting at (237, 56).
; PLAN: r0=237(x), r1=56(y), r2=71(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 56
LDI r2, 71
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
