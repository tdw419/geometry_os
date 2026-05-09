; DESCRIPTION: Draws a red rectangle at (207, 16) with width 77 and height 56.
; PLAN: r0=207(x), r1=16(y), r2=77(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 16
LDI r2, 77
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
