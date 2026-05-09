; DESCRIPTION: Draws a yellow rectangle at (467, 12) with width 16 and height 41.
; PLAN: r0=467(x), r1=12(y), r2=16(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 12
LDI r2, 16
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
