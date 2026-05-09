; DESCRIPTION: Draws a yellow rectangle at (168, 46) with width 98 and height 34.
; PLAN: r0=168(x), r1=46(y), r2=98(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 46
LDI r2, 98
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
