; DESCRIPTION: Places a yellow 45x24 rectangle at position (87, 59).
; PLAN: r0=87(x), r1=59(y), r2=45(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 59
LDI r2, 45
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
