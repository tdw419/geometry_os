; DESCRIPTION: Draws a green rectangle at (245, 93) with width 104 and height 109.
; PLAN: r0=245(x), r1=93(y), r2=104(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 93
LDI r2, 104
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
