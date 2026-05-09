; DESCRIPTION: Places a yellow 24x26 rectangle at position (165, 20).
; PLAN: r0=165(x), r1=20(y), r2=24(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 20
LDI r2, 24
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
