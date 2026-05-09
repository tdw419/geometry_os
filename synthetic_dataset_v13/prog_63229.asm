; DESCRIPTION: Draws a cyan rectangle at (26, 168) with width 117 and height 80.
; PLAN: r0=26(x), r1=168(y), r2=117(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 168
LDI r2, 117
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
