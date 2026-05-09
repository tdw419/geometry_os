; DESCRIPTION: Places a cyan 33x93 rectangle at position (437, 163).
; PLAN: r0=437(x), r1=163(y), r2=33(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 163
LDI r2, 33
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
