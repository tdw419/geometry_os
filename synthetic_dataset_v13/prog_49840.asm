; DESCRIPTION: Draws a cyan rectangle at (320, 96) with width 53 and height 48.
; PLAN: r0=320(x), r1=96(y), r2=53(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 96
LDI r2, 53
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
