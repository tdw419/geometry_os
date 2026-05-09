; DESCRIPTION: Draws a black rectangle at (217, 159) with width 16 and height 44.
; PLAN: r0=217(x), r1=159(y), r2=16(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 159
LDI r2, 16
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
