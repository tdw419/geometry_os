; DESCRIPTION: Draws a cyan rectangle at (300, 52) with width 109 and height 83.
; PLAN: r0=300(x), r1=52(y), r2=109(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 52
LDI r2, 109
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
