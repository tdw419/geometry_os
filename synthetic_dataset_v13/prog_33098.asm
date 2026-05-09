; DESCRIPTION: Places a cyan 94x24 rectangle at position (19, 118).
; PLAN: r0=19(x), r1=118(y), r2=94(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 118
LDI r2, 94
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
