; DESCRIPTION: Places a cyan 88x86 rectangle at position (81, 45).
; PLAN: r0=81(x), r1=45(y), r2=88(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 45
LDI r2, 88
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
