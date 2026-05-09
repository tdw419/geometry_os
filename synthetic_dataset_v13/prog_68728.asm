; DESCRIPTION: Draws a blue rectangle at (372, 10) with width 77 and height 95.
; PLAN: r0=372(x), r1=10(y), r2=77(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 10
LDI r2, 77
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
