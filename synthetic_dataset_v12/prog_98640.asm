; DESCRIPTION: Draws a yellow rectangle at (453, 196) with width 42 and height 34.
; PLAN: r0=453(x), r1=196(y), r2=42(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 196
LDI r2, 42
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
