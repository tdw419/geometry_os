; DESCRIPTION: Places a black 17x50 rectangle at position (210, 0).
; PLAN: r0=210(x), r1=0(y), r2=17(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 0
LDI r2, 17
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
