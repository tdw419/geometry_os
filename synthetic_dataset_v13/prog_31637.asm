; DESCRIPTION: Places a cyan 32x87 rectangle at position (237, 4).
; PLAN: r0=237(x), r1=4(y), r2=32(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 4
LDI r2, 32
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
