; DESCRIPTION: Draws a red rectangle at (425, 57) with width 44 and height 91.
; PLAN: r0=425(x), r1=57(y), r2=44(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 57
LDI r2, 44
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
