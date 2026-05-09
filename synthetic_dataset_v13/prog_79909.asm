; DESCRIPTION: Draws a green rectangle at (353, 168) with width 109 and height 34.
; PLAN: r0=353(x), r1=168(y), r2=109(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 168
LDI r2, 109
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
