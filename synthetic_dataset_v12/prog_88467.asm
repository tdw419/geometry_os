; DESCRIPTION: Places a cyan 34x37 rectangle at position (361, 25).
; PLAN: r0=361(x), r1=25(y), r2=34(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 25
LDI r2, 34
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
