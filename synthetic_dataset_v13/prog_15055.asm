; DESCRIPTION: Places a yellow 66x36 rectangle at position (177, 159).
; PLAN: r0=177(x), r1=159(y), r2=66(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 159
LDI r2, 66
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
