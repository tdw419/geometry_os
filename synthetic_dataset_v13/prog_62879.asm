; DESCRIPTION: Places a cyan 32x52 rectangle at position (64, 204).
; PLAN: r0=64(x), r1=204(y), r2=32(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 204
LDI r2, 32
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
