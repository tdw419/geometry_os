; DESCRIPTION: Draws a cyan rectangle at (292, 186) with width 13 and height 70.
; PLAN: r0=292(x), r1=186(y), r2=13(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 186
LDI r2, 13
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
