; DESCRIPTION: Places a yellow 17x82 rectangle at position (399, 40).
; PLAN: r0=399(x), r1=40(y), r2=17(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 40
LDI r2, 17
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
