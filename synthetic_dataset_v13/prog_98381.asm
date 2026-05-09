; DESCRIPTION: Draws a cyan rectangle at (239, 6) with width 86 and height 79.
; PLAN: r0=239(x), r1=6(y), r2=86(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 6
LDI r2, 86
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
