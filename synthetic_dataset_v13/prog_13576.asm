; DESCRIPTION: Draws a cyan rectangle at (392, 148) with width 24 and height 74.
; PLAN: r0=392(x), r1=148(y), r2=24(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 148
LDI r2, 24
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
