; DESCRIPTION: Draws a cyan rectangle at (237, 8) with width 72 and height 70.
; PLAN: r0=237(x), r1=8(y), r2=72(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 8
LDI r2, 72
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
