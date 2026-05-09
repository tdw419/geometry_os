; DESCRIPTION: Places a yellow 86x82 rectangle at position (344, 138).
; PLAN: r0=344(x), r1=138(y), r2=86(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 138
LDI r2, 86
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
