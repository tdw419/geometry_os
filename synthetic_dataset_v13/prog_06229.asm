; DESCRIPTION: Places a black 85x85 rectangle at position (111, 165).
; PLAN: r0=111(x), r1=165(y), r2=85(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 165
LDI r2, 85
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
