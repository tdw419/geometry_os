; DESCRIPTION: Renders a yellow box of size 86x30 starting at (319, 144).
; PLAN: r0=319(x), r1=144(y), r2=86(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 144
LDI r2, 86
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
