; DESCRIPTION: Draws a red rectangle at (294, 141) with width 73 and height 55.
; PLAN: r0=294(x), r1=141(y), r2=73(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 141
LDI r2, 73
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
