; DESCRIPTION: Places a cyan 39x24 rectangle at position (345, 158).
; PLAN: r0=345(x), r1=158(y), r2=39(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 158
LDI r2, 39
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
