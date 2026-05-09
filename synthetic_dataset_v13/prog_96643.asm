; DESCRIPTION: Places a black 82x46 rectangle at position (318, 14).
; PLAN: r0=318(x), r1=14(y), r2=82(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 14
LDI r2, 82
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
