; DESCRIPTION: Renders a green box of size 97x97 starting at (373, 37).
; PLAN: r0=373(x), r1=37(y), r2=97(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 37
LDI r2, 97
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
