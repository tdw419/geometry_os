; DESCRIPTION: Draws a white rectangle at (196, 120) with width 79 and height 47.
; PLAN: r0=196(x), r1=120(y), r2=79(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 120
LDI r2, 79
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
