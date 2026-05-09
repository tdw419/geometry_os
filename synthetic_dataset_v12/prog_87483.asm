; DESCRIPTION: Draws a yellow rectangle at (242, 141) with width 62 and height 87.
; PLAN: r0=242(x), r1=141(y), r2=62(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 141
LDI r2, 62
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
