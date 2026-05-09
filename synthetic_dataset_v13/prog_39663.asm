; DESCRIPTION: Draws a cyan rectangle at (206, 47) with width 88 and height 16.
; PLAN: r0=206(x), r1=47(y), r2=88(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 47
LDI r2, 88
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
