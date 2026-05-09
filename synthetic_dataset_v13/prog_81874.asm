; DESCRIPTION: Places a yellow 57x107 rectangle at position (68, 8).
; PLAN: r0=68(x), r1=8(y), r2=57(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 8
LDI r2, 57
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
