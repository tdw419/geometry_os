; DESCRIPTION: Draws a yellow rectangle at (324, 173) with width 45 and height 57.
; PLAN: r0=324(x), r1=173(y), r2=45(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 173
LDI r2, 45
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
