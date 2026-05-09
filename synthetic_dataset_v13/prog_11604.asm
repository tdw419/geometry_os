; DESCRIPTION: Places a black 27x118 rectangle at position (286, 10).
; PLAN: r0=286(x), r1=10(y), r2=27(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 10
LDI r2, 27
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
