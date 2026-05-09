; DESCRIPTION: Draws a red rectangle at (27, 50) with width 36 and height 25.
; PLAN: r0=27(x), r1=50(y), r2=36(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 50
LDI r2, 36
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
