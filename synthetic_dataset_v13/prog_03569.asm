; DESCRIPTION: Draws a cyan rectangle at (23, 133) with width 72 and height 88.
; PLAN: r0=23(x), r1=133(y), r2=72(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 133
LDI r2, 72
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
