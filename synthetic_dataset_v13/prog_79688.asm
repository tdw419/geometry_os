; DESCRIPTION: Places a blue 34x43 rectangle at position (306, 17).
; PLAN: r0=306(x), r1=17(y), r2=34(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 17
LDI r2, 34
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
