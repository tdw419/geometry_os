; DESCRIPTION: Places a cyan 68x66 rectangle at position (32, 137).
; PLAN: r0=32(x), r1=137(y), r2=68(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 137
LDI r2, 68
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
