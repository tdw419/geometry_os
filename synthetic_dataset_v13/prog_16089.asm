; DESCRIPTION: Places a red 30x35 rectangle at position (54, 218).
; PLAN: r0=54(x), r1=218(y), r2=30(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 218
LDI r2, 30
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
