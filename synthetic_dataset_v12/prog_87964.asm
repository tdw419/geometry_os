; DESCRIPTION: Draws a red rectangle at (298, 47) with width 101 and height 57.
; PLAN: r0=298(x), r1=47(y), r2=101(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 47
LDI r2, 101
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
