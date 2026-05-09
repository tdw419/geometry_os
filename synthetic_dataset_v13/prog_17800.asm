; DESCRIPTION: Places a green 97x44 rectangle at position (171, 32).
; PLAN: r0=171(x), r1=32(y), r2=97(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 32
LDI r2, 97
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
