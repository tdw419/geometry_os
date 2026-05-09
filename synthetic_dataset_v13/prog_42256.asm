; DESCRIPTION: Places a yellow 58x35 rectangle at position (424, 91).
; PLAN: r0=424(x), r1=91(y), r2=58(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 91
LDI r2, 58
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
