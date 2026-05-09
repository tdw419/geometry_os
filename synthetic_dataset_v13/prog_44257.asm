; DESCRIPTION: Places a cyan 80x74 rectangle at position (266, 101).
; PLAN: r0=266(x), r1=101(y), r2=80(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 101
LDI r2, 80
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
