; DESCRIPTION: Draws a cyan rectangle at (81, 57) with width 32 and height 33.
; PLAN: r0=81(x), r1=57(y), r2=32(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 57
LDI r2, 32
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
