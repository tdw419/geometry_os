; DESCRIPTION: Renders a yellow box of size 39x74 starting at (144, 176).
; PLAN: r0=144(x), r1=176(y), r2=39(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 176
LDI r2, 39
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
