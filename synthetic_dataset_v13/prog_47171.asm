; DESCRIPTION: Draws a yellow rectangle at (161, 177) with width 109 and height 48.
; PLAN: r0=161(x), r1=177(y), r2=109(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 177
LDI r2, 109
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
