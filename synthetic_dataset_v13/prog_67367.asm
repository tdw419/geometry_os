; DESCRIPTION: Draws a red rectangle at (281, 79) with width 23 and height 55.
; PLAN: r0=281(x), r1=79(y), r2=23(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 79
LDI r2, 23
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
