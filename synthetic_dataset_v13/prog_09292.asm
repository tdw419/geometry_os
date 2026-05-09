; DESCRIPTION: Places a green 66x86 rectangle at position (336, 64).
; PLAN: r0=336(x), r1=64(y), r2=66(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 64
LDI r2, 66
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
