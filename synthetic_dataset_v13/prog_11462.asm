; DESCRIPTION: Draws a white rectangle at (371, 152) with width 60 and height 89.
; PLAN: r0=371(x), r1=152(y), r2=60(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 152
LDI r2, 60
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
