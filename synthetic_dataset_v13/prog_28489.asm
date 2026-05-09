; DESCRIPTION: Places a black 93x47 rectangle at position (55, 59).
; PLAN: r0=55(x), r1=59(y), r2=93(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 59
LDI r2, 93
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
