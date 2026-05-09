; DESCRIPTION: Draws a red rectangle at (18, 168) with width 71 and height 79.
; PLAN: r0=18(x), r1=168(y), r2=71(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 168
LDI r2, 71
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
