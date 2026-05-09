; DESCRIPTION: Places a yellow 115x55 rectangle at position (4, 82).
; PLAN: r0=4(x), r1=82(y), r2=115(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 82
LDI r2, 115
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
