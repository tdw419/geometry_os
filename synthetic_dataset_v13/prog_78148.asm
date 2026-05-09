; DESCRIPTION: Places a cyan 36x32 rectangle at position (359, 218).
; PLAN: r0=359(x), r1=218(y), r2=36(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 218
LDI r2, 36
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
