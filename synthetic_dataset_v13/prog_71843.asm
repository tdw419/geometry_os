; DESCRIPTION: Draws a red rectangle at (368, 46) with width 113 and height 73.
; PLAN: r0=368(x), r1=46(y), r2=113(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 46
LDI r2, 113
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
