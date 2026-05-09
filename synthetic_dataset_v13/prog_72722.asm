; DESCRIPTION: Draws a black rectangle at (169, 154) with width 34 and height 24.
; PLAN: r0=169(x), r1=154(y), r2=34(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 154
LDI r2, 34
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
