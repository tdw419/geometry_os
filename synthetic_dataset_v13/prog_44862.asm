; DESCRIPTION: Draws a white rectangle at (251, 215) with width 34 and height 13.
; PLAN: r0=251(x), r1=215(y), r2=34(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 215
LDI r2, 34
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
