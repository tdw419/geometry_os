; DESCRIPTION: Places a cyan 32x16 rectangle at position (345, 186).
; PLAN: r0=345(x), r1=186(y), r2=32(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 186
LDI r2, 32
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
