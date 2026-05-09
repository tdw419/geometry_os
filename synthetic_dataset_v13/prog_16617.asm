; DESCRIPTION: Places a cyan 108x52 rectangle at position (334, 47).
; PLAN: r0=334(x), r1=47(y), r2=108(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 47
LDI r2, 108
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
