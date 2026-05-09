; DESCRIPTION: Draws a cyan rectangle at (3, 220) with width 68 and height 34.
; PLAN: r0=3(x), r1=220(y), r2=68(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 220
LDI r2, 68
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
