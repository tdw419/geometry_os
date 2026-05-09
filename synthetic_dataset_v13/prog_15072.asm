; DESCRIPTION: Draws a cyan rectangle at (16, 70) with width 40 and height 44.
; PLAN: r0=16(x), r1=70(y), r2=40(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 70
LDI r2, 40
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
