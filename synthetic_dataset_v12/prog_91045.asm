; DESCRIPTION: Draws a red rectangle at (294, 90) with width 85 and height 85.
; PLAN: r0=294(x), r1=90(y), r2=85(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 90
LDI r2, 85
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
