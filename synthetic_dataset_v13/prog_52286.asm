; DESCRIPTION: Places a cyan 78x93 rectangle at position (29, 29).
; PLAN: r0=29(x), r1=29(y), r2=78(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 29
LDI r2, 78
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
