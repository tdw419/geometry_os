; DESCRIPTION: Draws a cyan rectangle at (169, 169) with width 34 and height 61.
; PLAN: r0=169(x), r1=169(y), r2=34(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 169
LDI r2, 34
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
