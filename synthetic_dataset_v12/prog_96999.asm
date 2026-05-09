; DESCRIPTION: Draws a blue rectangle at (398, 77) with width 102 and height 57.
; PLAN: r0=398(x), r1=77(y), r2=102(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 77
LDI r2, 102
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
