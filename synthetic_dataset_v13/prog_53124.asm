; DESCRIPTION: Places a yellow 118x31 rectangle at position (332, 83).
; PLAN: r0=332(x), r1=83(y), r2=118(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 83
LDI r2, 118
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
