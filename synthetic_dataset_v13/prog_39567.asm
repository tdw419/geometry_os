; DESCRIPTION: Places a black 47x105 rectangle at position (79, 16).
; PLAN: r0=79(x), r1=16(y), r2=47(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 16
LDI r2, 47
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
