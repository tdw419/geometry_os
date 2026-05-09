; DESCRIPTION: Draws a cyan rectangle at (12, 14) with width 72 and height 32.
; PLAN: r0=12(x), r1=14(y), r2=72(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 14
LDI r2, 72
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
