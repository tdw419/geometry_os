; DESCRIPTION: Places a blue 85x44 rectangle at position (74, 4).
; PLAN: r0=74(x), r1=4(y), r2=85(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 4
LDI r2, 85
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
