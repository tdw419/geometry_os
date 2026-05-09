; DESCRIPTION: Places a yellow 10x59 rectangle at position (309, 138).
; PLAN: r0=309(x), r1=138(y), r2=10(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 138
LDI r2, 10
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
