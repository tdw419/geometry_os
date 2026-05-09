; DESCRIPTION: Draws a white rectangle at (16, 80) with width 61 and height 109.
; PLAN: r0=16(x), r1=80(y), r2=61(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 80
LDI r2, 61
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
