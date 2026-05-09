; DESCRIPTION: Places a green 93x24 rectangle at position (231, 50).
; PLAN: r0=231(x), r1=50(y), r2=93(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 50
LDI r2, 93
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
