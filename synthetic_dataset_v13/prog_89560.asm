; DESCRIPTION: Places a cyan 78x66 rectangle at position (28, 115).
; PLAN: r0=28(x), r1=115(y), r2=78(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 115
LDI r2, 78
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
