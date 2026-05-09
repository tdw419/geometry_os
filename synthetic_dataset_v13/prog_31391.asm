; DESCRIPTION: Places a yellow 47x82 rectangle at position (388, 73).
; PLAN: r0=388(x), r1=73(y), r2=47(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 73
LDI r2, 47
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
