; DESCRIPTION: Draws a red rectangle at (168, 5) with width 27 and height 17.
; PLAN: r0=168(x), r1=5(y), r2=27(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 5
LDI r2, 27
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
