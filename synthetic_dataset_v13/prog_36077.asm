; DESCRIPTION: Draws a red rectangle at (39, 58) with width 104 and height 65.
; PLAN: r0=39(x), r1=58(y), r2=104(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 58
LDI r2, 104
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
