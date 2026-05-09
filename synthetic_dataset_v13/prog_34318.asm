; DESCRIPTION: Places a yellow 83x106 rectangle at position (57, 59).
; PLAN: r0=57(x), r1=59(y), r2=83(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 59
LDI r2, 83
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
