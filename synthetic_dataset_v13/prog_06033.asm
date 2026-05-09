; DESCRIPTION: Places a blue 83x18 rectangle at position (74, 83).
; PLAN: r0=74(x), r1=83(y), r2=83(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 83
LDI r2, 83
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
