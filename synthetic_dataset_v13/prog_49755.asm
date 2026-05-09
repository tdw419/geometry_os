; DESCRIPTION: Places a cyan 64x94 rectangle at position (131, 65).
; PLAN: r0=131(x), r1=65(y), r2=64(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 65
LDI r2, 64
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
