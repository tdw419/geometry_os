; DESCRIPTION: Renders a green box of size 13x73 starting at (241, 165).
; PLAN: r0=241(x), r1=165(y), r2=13(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 165
LDI r2, 13
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
