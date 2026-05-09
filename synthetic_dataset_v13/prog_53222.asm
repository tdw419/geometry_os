; DESCRIPTION: Places a black 29x98 rectangle at position (79, 142).
; PLAN: r0=79(x), r1=142(y), r2=29(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 142
LDI r2, 29
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
