; DESCRIPTION: Places a black 100x17 rectangle at position (352, 38).
; PLAN: r0=352(x), r1=38(y), r2=100(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 38
LDI r2, 100
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
