; DESCRIPTION: Draws a red rectangle at (298, 74) with width 31 and height 113.
; PLAN: r0=298(x), r1=74(y), r2=31(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 74
LDI r2, 31
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
