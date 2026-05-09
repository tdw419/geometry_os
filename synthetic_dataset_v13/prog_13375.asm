; DESCRIPTION: Draws a green rectangle at (34, 229) with width 59 and height 21.
; PLAN: r0=34(x), r1=229(y), r2=59(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 229
LDI r2, 59
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
