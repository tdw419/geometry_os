; DESCRIPTION: Renders a green box of size 86x109 starting at (329, 9).
; PLAN: r0=329(x), r1=9(y), r2=86(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 9
LDI r2, 86
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
