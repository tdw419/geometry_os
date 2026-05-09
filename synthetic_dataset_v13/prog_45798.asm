; DESCRIPTION: Draws a white rectangle at (392, 118) with width 116 and height 42.
; PLAN: r0=392(x), r1=118(y), r2=116(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 118
LDI r2, 116
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
