; DESCRIPTION: Draws a white rectangle at (392, 72) with width 92 and height 36.
; PLAN: r0=392(x), r1=72(y), r2=92(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 72
LDI r2, 92
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
