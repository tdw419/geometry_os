; DESCRIPTION: Places a yellow 113x106 rectangle at position (97, 21).
; PLAN: r0=97(x), r1=21(y), r2=113(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 21
LDI r2, 113
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
