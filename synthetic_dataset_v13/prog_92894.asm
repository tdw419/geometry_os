; DESCRIPTION: Draws a white rectangle at (27, 95) with width 79 and height 72.
; PLAN: r0=27(x), r1=95(y), r2=79(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 95
LDI r2, 79
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
