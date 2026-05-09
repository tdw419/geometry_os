; DESCRIPTION: Draws a red rectangle at (251, 205) with width 98 and height 13.
; PLAN: r0=251(x), r1=205(y), r2=98(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 205
LDI r2, 98
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
