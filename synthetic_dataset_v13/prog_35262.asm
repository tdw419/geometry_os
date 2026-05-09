; DESCRIPTION: Renders a yellow box of size 35x44 starting at (307, 126).
; PLAN: r0=307(x), r1=126(y), r2=35(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 126
LDI r2, 35
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
