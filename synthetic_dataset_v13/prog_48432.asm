; DESCRIPTION: Draws a cyan rectangle at (210, 16) with width 25 and height 86.
; PLAN: r0=210(x), r1=16(y), r2=25(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 16
LDI r2, 25
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
