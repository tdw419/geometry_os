; DESCRIPTION: Places a purple 78x120 rectangle at position (285, 83).
; PLAN: r0=285(x), r1=83(y), r2=78(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 83
LDI r2, 78
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
