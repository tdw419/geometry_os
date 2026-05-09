; DESCRIPTION: Places a cyan 71x115 rectangle at position (231, 80).
; PLAN: r0=231(x), r1=80(y), r2=71(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 80
LDI r2, 71
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
