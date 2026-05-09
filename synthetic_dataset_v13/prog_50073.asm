; DESCRIPTION: Places a blue 74x46 rectangle at position (378, 70).
; PLAN: r0=378(x), r1=70(y), r2=74(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 70
LDI r2, 74
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
