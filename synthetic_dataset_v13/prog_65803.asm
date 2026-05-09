; DESCRIPTION: Draws a cyan rectangle at (369, 0) with width 59 and height 112.
; PLAN: r0=369(x), r1=0(y), r2=59(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 0
LDI r2, 59
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
