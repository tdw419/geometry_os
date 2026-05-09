; DESCRIPTION: Places a yellow 68x66 rectangle at position (272, 36).
; PLAN: r0=272(x), r1=36(y), r2=68(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 36
LDI r2, 68
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
