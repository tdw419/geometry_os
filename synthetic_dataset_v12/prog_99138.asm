; DESCRIPTION: Places a red 112x94 rectangle at position (360, 137).
; PLAN: r0=360(x), r1=137(y), r2=112(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 137
LDI r2, 112
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
