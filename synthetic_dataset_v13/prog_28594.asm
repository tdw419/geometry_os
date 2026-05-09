; DESCRIPTION: Draws a red rectangle at (293, 77) with width 72 and height 59.
; PLAN: r0=293(x), r1=77(y), r2=72(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 77
LDI r2, 72
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
