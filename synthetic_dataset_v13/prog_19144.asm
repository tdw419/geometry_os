; DESCRIPTION: Draws a white rectangle at (392, 119) with width 85 and height 115.
; PLAN: r0=392(x), r1=119(y), r2=85(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 119
LDI r2, 85
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
