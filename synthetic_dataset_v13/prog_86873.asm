; DESCRIPTION: Places a red 35x81 rectangle at position (218, 167).
; PLAN: r0=218(x), r1=167(y), r2=35(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 167
LDI r2, 35
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
