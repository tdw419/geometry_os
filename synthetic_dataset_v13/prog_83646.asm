; DESCRIPTION: Draws a yellow rectangle at (173, 107) with width 87 and height 37.
; PLAN: r0=173(x), r1=107(y), r2=87(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 107
LDI r2, 87
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
