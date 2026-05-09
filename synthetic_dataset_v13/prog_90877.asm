; DESCRIPTION: Places a black 29x50 rectangle at position (52, 82).
; PLAN: r0=52(x), r1=82(y), r2=29(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 82
LDI r2, 29
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
