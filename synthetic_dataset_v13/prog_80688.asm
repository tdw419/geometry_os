; DESCRIPTION: Places a black 15x47 rectangle at position (68, 6).
; PLAN: r0=68(x), r1=6(y), r2=15(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 6
LDI r2, 15
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
