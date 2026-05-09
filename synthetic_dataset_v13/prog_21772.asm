; DESCRIPTION: Places a cyan 80x93 rectangle at position (230, 102).
; PLAN: r0=230(x), r1=102(y), r2=80(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 102
LDI r2, 80
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
