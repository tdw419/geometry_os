; DESCRIPTION: Places a red 99x73 rectangle at position (354, 58).
; PLAN: r0=354(x), r1=58(y), r2=99(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 58
LDI r2, 99
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
