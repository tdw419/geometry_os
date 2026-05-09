; DESCRIPTION: Draws a cyan rectangle at (369, 46) with width 109 and height 116.
; PLAN: r0=369(x), r1=46(y), r2=109(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 46
LDI r2, 109
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
