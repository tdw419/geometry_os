; DESCRIPTION: Places a yellow 53x21 rectangle at position (303, 112).
; PLAN: r0=303(x), r1=112(y), r2=53(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 112
LDI r2, 53
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
