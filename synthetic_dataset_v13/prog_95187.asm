; DESCRIPTION: Places a cyan 108x12 rectangle at position (23, 132).
; PLAN: r0=23(x), r1=132(y), r2=108(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 132
LDI r2, 108
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
