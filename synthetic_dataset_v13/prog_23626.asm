; DESCRIPTION: Renders a black box of size 115x63 starting at (225, 55).
; PLAN: r0=225(x), r1=55(y), r2=115(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 55
LDI r2, 115
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
