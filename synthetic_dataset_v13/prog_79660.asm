; DESCRIPTION: Draws a red rectangle at (367, 59) with width 83 and height 103.
; PLAN: r0=367(x), r1=59(y), r2=83(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 59
LDI r2, 83
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
