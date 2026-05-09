; DESCRIPTION: Renders a green box of size 55x115 starting at (382, 69).
; PLAN: r0=382(x), r1=69(y), r2=55(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 69
LDI r2, 55
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
