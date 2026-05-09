; DESCRIPTION: Places a red 112x31 rectangle at position (13, 188).
; PLAN: r0=13(x), r1=188(y), r2=112(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 188
LDI r2, 112
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
