; DESCRIPTION: Renders a green box of size 87x97 starting at (213, 13).
; PLAN: r0=213(x), r1=13(y), r2=87(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 13
LDI r2, 87
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
