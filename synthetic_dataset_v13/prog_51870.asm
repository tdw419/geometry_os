; DESCRIPTION: Draws a yellow rectangle at (198, 168) with width 12 and height 71.
; PLAN: r0=198(x), r1=168(y), r2=12(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 168
LDI r2, 12
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
