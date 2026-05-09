; DESCRIPTION: Renders a green box of size 43x93 starting at (148, 94).
; PLAN: r0=148(x), r1=94(y), r2=43(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 94
LDI r2, 43
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
