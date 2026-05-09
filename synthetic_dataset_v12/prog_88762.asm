; DESCRIPTION: Places a black 79x25 rectangle at position (324, 167).
; PLAN: r0=324(x), r1=167(y), r2=79(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 167
LDI r2, 79
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
