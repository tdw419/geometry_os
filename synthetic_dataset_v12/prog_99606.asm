; DESCRIPTION: Draws a red rectangle at (187, 95) with width 26 and height 85.
; PLAN: r0=187(x), r1=95(y), r2=26(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 95
LDI r2, 26
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
