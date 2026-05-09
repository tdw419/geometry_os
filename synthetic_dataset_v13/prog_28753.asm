; DESCRIPTION: Places a cyan 93x60 rectangle at position (302, 26).
; PLAN: r0=302(x), r1=26(y), r2=93(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 26
LDI r2, 93
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
