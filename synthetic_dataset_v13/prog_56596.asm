; DESCRIPTION: Renders a black box of size 54x23 starting at (319, 160).
; PLAN: r0=319(x), r1=160(y), r2=54(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 160
LDI r2, 54
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
