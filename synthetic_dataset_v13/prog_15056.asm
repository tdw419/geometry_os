; DESCRIPTION: Places a purple 54x28 rectangle at position (360, 83).
; PLAN: r0=360(x), r1=83(y), r2=54(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 83
LDI r2, 54
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
