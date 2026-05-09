; DESCRIPTION: Places a black 50x66 rectangle at position (318, 107).
; PLAN: r0=318(x), r1=107(y), r2=50(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 107
LDI r2, 50
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
