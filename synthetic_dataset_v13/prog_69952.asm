; DESCRIPTION: Renders a green box of size 117x36 starting at (382, 71).
; PLAN: r0=382(x), r1=71(y), r2=117(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 71
LDI r2, 117
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
