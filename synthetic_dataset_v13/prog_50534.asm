; DESCRIPTION: Draws a cyan rectangle at (217, 144) with width 86 and height 59.
; PLAN: r0=217(x), r1=144(y), r2=86(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 144
LDI r2, 86
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
