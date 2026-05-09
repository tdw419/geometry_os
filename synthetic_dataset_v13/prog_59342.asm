; DESCRIPTION: Draws a orange rectangle at (186, 169) with width 64 and height 87.
; PLAN: r0=186(x), r1=169(y), r2=64(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 169
LDI r2, 64
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
