; DESCRIPTION: Draws a red rectangle at (410, 205) with width 80 and height 17.
; PLAN: r0=410(x), r1=205(y), r2=80(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 205
LDI r2, 80
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
