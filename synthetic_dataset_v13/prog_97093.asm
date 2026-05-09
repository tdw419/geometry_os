; DESCRIPTION: Places a green 64x94 rectangle at position (295, 109).
; PLAN: r0=295(x), r1=109(y), r2=64(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 109
LDI r2, 64
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
