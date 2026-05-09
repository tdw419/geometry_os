; DESCRIPTION: Draws a red rectangle at (365, 216) with width 104 and height 25.
; PLAN: r0=365(x), r1=216(y), r2=104(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 216
LDI r2, 104
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
