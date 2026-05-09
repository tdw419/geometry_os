; DESCRIPTION: Places a cyan 63x77 rectangle at position (258, 34).
; PLAN: r0=258(x), r1=34(y), r2=63(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 34
LDI r2, 63
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
