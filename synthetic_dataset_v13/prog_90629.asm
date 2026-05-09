; DESCRIPTION: Places a cyan 28x78 rectangle at position (256, 168).
; PLAN: r0=256(x), r1=168(y), r2=28(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 168
LDI r2, 28
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
