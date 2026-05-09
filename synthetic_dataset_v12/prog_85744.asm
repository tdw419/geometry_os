; DESCRIPTION: Draws a red rectangle at (237, 126) with width 77 and height 36.
; PLAN: r0=237(x), r1=126(y), r2=77(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 126
LDI r2, 77
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
