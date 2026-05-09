; DESCRIPTION: Places a black 48x94 rectangle at position (45, 106).
; PLAN: r0=45(x), r1=106(y), r2=48(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 106
LDI r2, 48
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
