; DESCRIPTION: Draws a cyan rectangle at (329, 4) with width 30 and height 21.
; PLAN: r0=329(x), r1=4(y), r2=30(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 4
LDI r2, 30
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
