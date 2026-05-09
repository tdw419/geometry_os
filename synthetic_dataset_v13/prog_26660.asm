; DESCRIPTION: Draws a white rectangle at (16, 46) with width 10 and height 104.
; PLAN: r0=16(x), r1=46(y), r2=10(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 46
LDI r2, 10
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
