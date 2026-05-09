; DESCRIPTION: Places a black 37x20 rectangle at position (12, 226).
; PLAN: r0=12(x), r1=226(y), r2=37(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 226
LDI r2, 37
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
