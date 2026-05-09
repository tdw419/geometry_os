; DESCRIPTION: Places a yellow 82x57 rectangle at position (11, 56).
; PLAN: r0=11(x), r1=56(y), r2=82(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 56
LDI r2, 82
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
