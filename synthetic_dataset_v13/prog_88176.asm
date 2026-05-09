; DESCRIPTION: Places a cyan 22x23 rectangle at position (411, 201).
; PLAN: r0=411(x), r1=201(y), r2=22(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 201
LDI r2, 22
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
