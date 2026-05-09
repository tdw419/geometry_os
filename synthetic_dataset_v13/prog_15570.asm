; DESCRIPTION: Draws a cyan rectangle at (371, 96) with width 71 and height 86.
; PLAN: r0=371(x), r1=96(y), r2=71(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 96
LDI r2, 71
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
