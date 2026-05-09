; DESCRIPTION: Places a cyan 103x98 rectangle at position (97, 5).
; PLAN: r0=97(x), r1=5(y), r2=103(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 5
LDI r2, 103
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
