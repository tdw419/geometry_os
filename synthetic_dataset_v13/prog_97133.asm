; DESCRIPTION: Places a black 102x35 rectangle at position (153, 200).
; PLAN: r0=153(x), r1=200(y), r2=102(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 200
LDI r2, 102
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
