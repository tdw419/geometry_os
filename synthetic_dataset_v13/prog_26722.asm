; DESCRIPTION: Places a cyan 86x94 rectangle at position (114, 48).
; PLAN: r0=114(x), r1=48(y), r2=86(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 48
LDI r2, 86
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
