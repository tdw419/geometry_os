; DESCRIPTION: Draws a cyan rectangle at (120, 57) with width 64 and height 106.
; PLAN: r0=120(x), r1=57(y), r2=64(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 64
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
