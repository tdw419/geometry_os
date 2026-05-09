; DESCRIPTION: Draws a red rectangle at (392, 92) with width 83 and height 105.
; PLAN: r0=392(x), r1=92(y), r2=83(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 92
LDI r2, 83
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
