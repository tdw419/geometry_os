; DESCRIPTION: Draws a red rectangle at (38, 186) with width 40 and height 17.
; PLAN: r0=38(x), r1=186(y), r2=40(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 186
LDI r2, 40
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
