; DESCRIPTION: Draws a green rectangle at (398, 44) with width 30 and height 100.
; PLAN: r0=398(x), r1=44(y), r2=30(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 44
LDI r2, 30
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
