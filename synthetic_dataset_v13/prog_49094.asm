; DESCRIPTION: Draws a cyan rectangle at (353, 13) with width 108 and height 79.
; PLAN: r0=353(x), r1=13(y), r2=108(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 13
LDI r2, 108
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
