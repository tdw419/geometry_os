; DESCRIPTION: Draws a cyan rectangle at (410, 7) with width 89 and height 79.
; PLAN: r0=410(x), r1=7(y), r2=89(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 7
LDI r2, 89
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
