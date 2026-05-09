; DESCRIPTION: Places a black 29x31 rectangle at position (317, 193).
; PLAN: r0=317(x), r1=193(y), r2=29(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 193
LDI r2, 29
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
