; DESCRIPTION: Draws a red rectangle at (109, 71) with width 70 and height 32.
; PLAN: r0=109(x), r1=71(y), r2=70(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 71
LDI r2, 70
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
