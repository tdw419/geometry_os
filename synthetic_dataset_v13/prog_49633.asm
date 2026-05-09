; DESCRIPTION: Places a cyan 18x107 rectangle at position (12, 4).
; PLAN: r0=12(x), r1=4(y), r2=18(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 4
LDI r2, 18
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
