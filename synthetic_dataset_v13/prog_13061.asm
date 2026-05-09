; DESCRIPTION: Places a yellow 106x80 rectangle at position (57, 66).
; PLAN: r0=57(x), r1=66(y), r2=106(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 66
LDI r2, 106
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
