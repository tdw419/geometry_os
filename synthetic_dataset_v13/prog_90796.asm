; DESCRIPTION: Places a cyan 36x107 rectangle at position (56, 15).
; PLAN: r0=56(x), r1=15(y), r2=36(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 15
LDI r2, 36
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
