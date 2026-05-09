; DESCRIPTION: Draws a cyan rectangle at (175, 20) with width 72 and height 77.
; PLAN: r0=175(x), r1=20(y), r2=72(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 20
LDI r2, 72
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
