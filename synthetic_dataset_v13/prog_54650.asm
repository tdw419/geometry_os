; DESCRIPTION: Places a yellow 24x115 rectangle at position (356, 106).
; PLAN: r0=356(x), r1=106(y), r2=24(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 106
LDI r2, 24
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
