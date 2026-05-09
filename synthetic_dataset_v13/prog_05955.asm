; DESCRIPTION: Draws a cyan rectangle at (178, 120) with width 117 and height 73.
; PLAN: r0=178(x), r1=120(y), r2=117(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 120
LDI r2, 117
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
