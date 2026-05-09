; DESCRIPTION: Places a yellow 106x66 rectangle at position (261, 45).
; PLAN: r0=261(x), r1=45(y), r2=106(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 45
LDI r2, 106
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
