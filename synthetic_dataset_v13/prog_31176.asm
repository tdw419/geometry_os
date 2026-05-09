; DESCRIPTION: Places a yellow 59x26 rectangle at position (71, 144).
; PLAN: r0=71(x), r1=144(y), r2=59(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 144
LDI r2, 59
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
