; DESCRIPTION: Places a black 112x99 rectangle at position (82, 82).
; PLAN: r0=82(x), r1=82(y), r2=112(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 82
LDI r2, 112
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
