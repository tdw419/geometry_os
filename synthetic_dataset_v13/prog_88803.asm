; DESCRIPTION: Draws a cyan rectangle at (149, 55) with width 120 and height 68.
; PLAN: r0=149(x), r1=55(y), r2=120(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 55
LDI r2, 120
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
