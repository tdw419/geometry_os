; DESCRIPTION: Draws a red rectangle at (71, 107) with width 109 and height 90.
; PLAN: r0=71(x), r1=107(y), r2=109(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 107
LDI r2, 109
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
