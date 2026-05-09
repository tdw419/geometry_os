; DESCRIPTION: Draws a green rectangle at (246, 47) with width 39 and height 117.
; PLAN: r0=246(x), r1=47(y), r2=39(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 47
LDI r2, 39
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
