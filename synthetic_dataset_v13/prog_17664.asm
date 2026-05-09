; DESCRIPTION: Places a black 93x39 rectangle at position (411, 82).
; PLAN: r0=411(x), r1=82(y), r2=93(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 82
LDI r2, 93
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
