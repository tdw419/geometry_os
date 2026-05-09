; DESCRIPTION: Draws a red rectangle at (168, 33) with width 94 and height 36.
; PLAN: r0=168(x), r1=33(y), r2=94(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 33
LDI r2, 94
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
