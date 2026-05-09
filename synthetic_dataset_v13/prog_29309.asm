; DESCRIPTION: Draws a red rectangle at (71, 20) with width 47 and height 32.
; PLAN: r0=71(x), r1=20(y), r2=47(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 20
LDI r2, 47
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
