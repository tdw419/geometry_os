; DESCRIPTION: Draws a cyan rectangle at (50, 134) with width 91 and height 116.
; PLAN: r0=50(x), r1=134(y), r2=91(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 134
LDI r2, 91
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
