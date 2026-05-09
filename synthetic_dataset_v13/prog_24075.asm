; DESCRIPTION: Places a cyan 57x28 rectangle at position (7, 10).
; PLAN: r0=7(x), r1=10(y), r2=57(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 10
LDI r2, 57
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
