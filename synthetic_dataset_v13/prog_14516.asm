; DESCRIPTION: Places a cyan 109x58 rectangle at position (345, 143).
; PLAN: r0=345(x), r1=143(y), r2=109(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 143
LDI r2, 109
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
