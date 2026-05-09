; DESCRIPTION: Renders a green box of size 98x108 starting at (47, 39).
; PLAN: r0=47(x), r1=39(y), r2=98(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 39
LDI r2, 98
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
