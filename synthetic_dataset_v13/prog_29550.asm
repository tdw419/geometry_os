; DESCRIPTION: Draws a yellow rectangle at (129, 154) with width 46 and height 39.
; PLAN: r0=129(x), r1=154(y), r2=46(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 154
LDI r2, 46
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
