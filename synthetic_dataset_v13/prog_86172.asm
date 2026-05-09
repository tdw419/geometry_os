; DESCRIPTION: Places a cyan 30x98 rectangle at position (7, 78).
; PLAN: r0=7(x), r1=78(y), r2=30(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 78
LDI r2, 30
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
