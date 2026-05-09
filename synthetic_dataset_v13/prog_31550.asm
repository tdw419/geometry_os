; DESCRIPTION: Draws a white rectangle at (187, 108) with width 103 and height 99.
; PLAN: r0=187(x), r1=108(y), r2=103(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 108
LDI r2, 103
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
