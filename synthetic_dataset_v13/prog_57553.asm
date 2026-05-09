; DESCRIPTION: Places a black 86x44 rectangle at position (225, 130).
; PLAN: r0=225(x), r1=130(y), r2=86(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 130
LDI r2, 86
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
