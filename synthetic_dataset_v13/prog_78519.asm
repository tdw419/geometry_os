; DESCRIPTION: Draws a cyan rectangle at (176, 100) with width 48 and height 34.
; PLAN: r0=176(x), r1=100(y), r2=48(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 100
LDI r2, 48
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
