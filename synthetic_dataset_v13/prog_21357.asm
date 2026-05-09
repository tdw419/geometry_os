; DESCRIPTION: Places a black 68x51 rectangle at position (21, 148).
; PLAN: r0=21(x), r1=148(y), r2=68(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 148
LDI r2, 68
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
