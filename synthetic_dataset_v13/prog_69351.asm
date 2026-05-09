; DESCRIPTION: Places a cyan 23x28 rectangle at position (57, 52).
; PLAN: r0=57(x), r1=52(y), r2=23(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 52
LDI r2, 23
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
