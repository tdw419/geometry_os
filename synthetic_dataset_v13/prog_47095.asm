; DESCRIPTION: Places a black 18x44 rectangle at position (52, 55).
; PLAN: r0=52(x), r1=55(y), r2=18(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 55
LDI r2, 18
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
