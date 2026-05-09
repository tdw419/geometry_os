; DESCRIPTION: Renders a green box of size 90x115 starting at (382, 55).
; PLAN: r0=382(x), r1=55(y), r2=90(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 55
LDI r2, 90
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
