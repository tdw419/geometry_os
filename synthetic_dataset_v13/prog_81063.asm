; DESCRIPTION: Places a cyan 36x20 rectangle at position (360, 217).
; PLAN: r0=360(x), r1=217(y), r2=36(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 217
LDI r2, 36
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
