; DESCRIPTION: Draws a cyan rectangle at (65, 120) with width 74 and height 11.
; PLAN: r0=65(x), r1=120(y), r2=74(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 120
LDI r2, 74
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
