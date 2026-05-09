; DESCRIPTION: Draws a white rectangle at (174, 150) with width 87 and height 39.
; PLAN: r0=174(x), r1=150(y), r2=87(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 150
LDI r2, 87
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
