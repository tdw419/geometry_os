; DESCRIPTION: Draws a cyan rectangle at (344, 189) with width 50 and height 27.
; PLAN: r0=344(x), r1=189(y), r2=50(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 189
LDI r2, 50
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
