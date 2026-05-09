; DESCRIPTION: Places a cyan 97x68 rectangle at position (333, 103).
; PLAN: r0=333(x), r1=103(y), r2=97(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 103
LDI r2, 97
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
