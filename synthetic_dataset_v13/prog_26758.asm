; DESCRIPTION: Draws a red rectangle at (283, 150) with width 104 and height 61.
; PLAN: r0=283(x), r1=150(y), r2=104(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 150
LDI r2, 104
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
