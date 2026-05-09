; DESCRIPTION: Places a yellow 68x107 rectangle at position (165, 7).
; PLAN: r0=165(x), r1=7(y), r2=68(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 7
LDI r2, 68
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
