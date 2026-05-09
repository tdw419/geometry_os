; DESCRIPTION: Draws a red rectangle at (379, 44) with width 104 and height 71.
; PLAN: r0=379(x), r1=44(y), r2=104(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 44
LDI r2, 104
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
