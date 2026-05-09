; DESCRIPTION: Renders a green box of size 97x19 starting at (274, 171).
; PLAN: r0=274(x), r1=171(y), r2=97(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 171
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
