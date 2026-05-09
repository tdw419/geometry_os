; DESCRIPTION: Draws a red rectangle at (215, 59) with width 60 and height 57.
; PLAN: r0=215(x), r1=59(y), r2=60(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 60
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
