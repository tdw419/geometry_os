; DESCRIPTION: Draws a red rectangle at (330, 169) with width 50 and height 68.
; PLAN: r0=330(x), r1=169(y), r2=50(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 169
LDI r2, 50
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
