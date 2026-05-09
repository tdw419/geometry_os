; DESCRIPTION: Places a black 45x86 rectangle at position (110, 107).
; PLAN: r0=110(x), r1=107(y), r2=45(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 107
LDI r2, 45
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
