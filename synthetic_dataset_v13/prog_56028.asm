; DESCRIPTION: Places a cyan 14x89 rectangle at position (209, 10).
; PLAN: r0=209(x), r1=10(y), r2=14(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 10
LDI r2, 14
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
