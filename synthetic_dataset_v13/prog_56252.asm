; DESCRIPTION: Places a cyan 97x120 rectangle at position (34, 108).
; PLAN: r0=34(x), r1=108(y), r2=97(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 108
LDI r2, 97
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
