; DESCRIPTION: Places a black 46x106 rectangle at position (120, 59).
; PLAN: r0=120(x), r1=59(y), r2=46(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 59
LDI r2, 46
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
