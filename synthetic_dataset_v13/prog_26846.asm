; DESCRIPTION: Draws a green rectangle at (446, 205) with width 54 and height 17.
; PLAN: r0=446(x), r1=205(y), r2=54(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 205
LDI r2, 54
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
