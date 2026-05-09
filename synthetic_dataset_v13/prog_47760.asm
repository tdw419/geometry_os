; DESCRIPTION: Places a yellow 59x112 rectangle at position (24, 60).
; PLAN: r0=24(x), r1=60(y), r2=59(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 60
LDI r2, 59
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
