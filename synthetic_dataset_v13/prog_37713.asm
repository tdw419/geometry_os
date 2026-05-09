; DESCRIPTION: Draws a red rectangle at (400, 107) with width 20 and height 78.
; PLAN: r0=400(x), r1=107(y), r2=20(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 107
LDI r2, 20
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
