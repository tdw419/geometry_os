; DESCRIPTION: Draws a yellow rectangle at (56, 112) with width 73 and height 42.
; PLAN: r0=56(x), r1=112(y), r2=73(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 112
LDI r2, 73
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
