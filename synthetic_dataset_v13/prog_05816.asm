; DESCRIPTION: Draws a red rectangle at (428, 235) with width 76 and height 16.
; PLAN: r0=428(x), r1=235(y), r2=76(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 235
LDI r2, 76
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
