; DESCRIPTION: Draws a yellow rectangle at (295, 176) with width 34 and height 48.
; PLAN: r0=295(x), r1=176(y), r2=34(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 176
LDI r2, 34
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
