; DESCRIPTION: Draws a white rectangle at (243, 87) with width 104 and height 45.
; PLAN: r0=243(x), r1=87(y), r2=104(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 87
LDI r2, 104
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
