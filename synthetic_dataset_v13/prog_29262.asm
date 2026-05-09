; DESCRIPTION: Renders a blue box of size 25x58 starting at (468, 196).
; PLAN: r0=468(x), r1=196(y), r2=25(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 196
LDI r2, 25
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
