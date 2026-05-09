; DESCRIPTION: Places a yellow 59x24 rectangle at position (143, 230).
; PLAN: r0=143(x), r1=230(y), r2=59(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 230
LDI r2, 59
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
