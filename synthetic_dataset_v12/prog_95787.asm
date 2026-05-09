; DESCRIPTION: Places a red 108x17 rectangle at position (153, 96).
; PLAN: r0=153(x), r1=96(y), r2=108(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 96
LDI r2, 108
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
