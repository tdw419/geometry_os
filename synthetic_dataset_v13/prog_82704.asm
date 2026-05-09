; DESCRIPTION: Draws a red rectangle at (386, 62) with width 13 and height 94.
; PLAN: r0=386(x), r1=62(y), r2=13(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 62
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
