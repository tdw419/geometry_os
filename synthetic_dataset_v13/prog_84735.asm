; DESCRIPTION: Places a cyan 94x105 rectangle at position (315, 81).
; PLAN: r0=315(x), r1=81(y), r2=94(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 81
LDI r2, 94
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
