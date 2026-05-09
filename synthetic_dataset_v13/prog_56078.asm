; DESCRIPTION: Draws a blue rectangle at (398, 148) with width 48 and height 102.
; PLAN: r0=398(x), r1=148(y), r2=48(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 148
LDI r2, 48
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
