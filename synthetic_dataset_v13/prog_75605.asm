; DESCRIPTION: Draws a green rectangle at (57, 152) with width 117 and height 18.
; PLAN: r0=57(x), r1=152(y), r2=117(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 152
LDI r2, 117
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
