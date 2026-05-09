; DESCRIPTION: Draws a white rectangle at (112, 180) with width 99 and height 16.
; PLAN: r0=112(x), r1=180(y), r2=99(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 180
LDI r2, 99
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
