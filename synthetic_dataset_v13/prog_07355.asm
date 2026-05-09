; DESCRIPTION: Places a cyan 75x75 rectangle at position (64, 34).
; PLAN: r0=64(x), r1=34(y), r2=75(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 34
LDI r2, 75
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
