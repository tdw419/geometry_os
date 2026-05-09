; DESCRIPTION: Draws a red rectangle at (392, 78) with width 61 and height 103.
; PLAN: r0=392(x), r1=78(y), r2=61(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 78
LDI r2, 61
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
