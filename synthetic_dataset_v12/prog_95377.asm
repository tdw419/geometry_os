; DESCRIPTION: Places a purple 108x44 rectangle at position (189, 91).
; PLAN: r0=189(x), r1=91(y), r2=108(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 91
LDI r2, 108
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
