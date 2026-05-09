; DESCRIPTION: Draws a cyan rectangle at (428, 148) with width 56 and height 94.
; PLAN: r0=428(x), r1=148(y), r2=56(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 148
LDI r2, 56
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
