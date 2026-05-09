; DESCRIPTION: Places a yellow 95x16 rectangle at position (97, 65).
; PLAN: r0=97(x), r1=65(y), r2=95(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 65
LDI r2, 95
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
