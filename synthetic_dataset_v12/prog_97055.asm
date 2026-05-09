; DESCRIPTION: Places a cyan 115x24 rectangle at position (270, 68).
; PLAN: r0=270(x), r1=68(y), r2=115(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 68
LDI r2, 115
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
