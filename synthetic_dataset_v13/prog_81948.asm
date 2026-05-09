; DESCRIPTION: Renders a black box of size 115x39 starting at (290, 188).
; PLAN: r0=290(x), r1=188(y), r2=115(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 188
LDI r2, 115
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
