; DESCRIPTION: Draws a white rectangle at (21, 50) with width 110 and height 48.
; PLAN: r0=21(x), r1=50(y), r2=110(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 50
LDI r2, 110
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
