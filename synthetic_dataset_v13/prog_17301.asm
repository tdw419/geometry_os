; DESCRIPTION: Places a yellow 115x24 rectangle at position (178, 25).
; PLAN: r0=178(x), r1=25(y), r2=115(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 25
LDI r2, 115
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
