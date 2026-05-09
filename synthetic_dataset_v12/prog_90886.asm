; DESCRIPTION: Draws a yellow rectangle at (259, 124) with width 85 and height 48.
; PLAN: r0=259(x), r1=124(y), r2=85(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 124
LDI r2, 85
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
