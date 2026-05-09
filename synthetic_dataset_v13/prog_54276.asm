; DESCRIPTION: Places a black 98x120 rectangle at position (251, 13).
; PLAN: r0=251(x), r1=13(y), r2=98(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 13
LDI r2, 98
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
