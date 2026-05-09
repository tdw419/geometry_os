; DESCRIPTION: Draws a white rectangle at (386, 13) with width 31 and height 79.
; PLAN: r0=386(x), r1=13(y), r2=31(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 13
LDI r2, 31
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
