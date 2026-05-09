; DESCRIPTION: Places a black 54x98 rectangle at position (251, 128).
; PLAN: r0=251(x), r1=128(y), r2=54(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 128
LDI r2, 54
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
