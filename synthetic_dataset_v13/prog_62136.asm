; DESCRIPTION: Places a yellow 81x17 rectangle at position (39, 109).
; PLAN: r0=39(x), r1=109(y), r2=81(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 81
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
