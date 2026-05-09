; DESCRIPTION: Renders a purple box of size 86x58 starting at (236, 56).
; PLAN: r0=236(x), r1=56(y), r2=86(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 56
LDI r2, 86
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
