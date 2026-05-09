; DESCRIPTION: Places a yellow 86x31 rectangle at position (368, 157).
; PLAN: r0=368(x), r1=157(y), r2=86(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 157
LDI r2, 86
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
