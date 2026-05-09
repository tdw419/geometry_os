; DESCRIPTION: Draws a white rectangle at (295, 44) with width 91 and height 43.
; PLAN: r0=295(x), r1=44(y), r2=91(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 44
LDI r2, 91
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
