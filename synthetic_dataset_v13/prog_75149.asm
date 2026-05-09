; DESCRIPTION: Draws a red rectangle at (285, 168) with width 104 and height 52.
; PLAN: r0=285(x), r1=168(y), r2=104(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 168
LDI r2, 104
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
