; DESCRIPTION: Draws a cyan rectangle at (142, 175) with width 48 and height 10.
; PLAN: r0=142(x), r1=175(y), r2=48(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 175
LDI r2, 48
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
