; DESCRIPTION: Renders a green box of size 94x105 starting at (309, 138).
; PLAN: r0=309(x), r1=138(y), r2=94(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 138
LDI r2, 94
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
