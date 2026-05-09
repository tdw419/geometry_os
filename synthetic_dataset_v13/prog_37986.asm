; DESCRIPTION: Renders a green box of size 115x58 starting at (319, 113).
; PLAN: r0=319(x), r1=113(y), r2=115(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 113
LDI r2, 115
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
