; DESCRIPTION: Places a black 57x77 rectangle at position (170, 27).
; PLAN: r0=170(x), r1=27(y), r2=57(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 27
LDI r2, 57
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
