; DESCRIPTION: Draws a yellow rectangle at (164, 154) with width 54 and height 16.
; PLAN: r0=164(x), r1=154(y), r2=54(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 154
LDI r2, 54
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
