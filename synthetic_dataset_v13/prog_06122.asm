; DESCRIPTION: Draws a white rectangle at (187, 13) with width 120 and height 100.
; PLAN: r0=187(x), r1=13(y), r2=120(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 13
LDI r2, 120
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
