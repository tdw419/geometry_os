; DESCRIPTION: Draws a red rectangle at (368, 146) with width 54 and height 31.
; PLAN: r0=368(x), r1=146(y), r2=54(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 146
LDI r2, 54
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
