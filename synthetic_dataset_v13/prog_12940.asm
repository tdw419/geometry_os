; DESCRIPTION: Draws a red rectangle at (392, 7) with width 44 and height 89.
; PLAN: r0=392(x), r1=7(y), r2=44(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 7
LDI r2, 44
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
