; DESCRIPTION: Places a orange 102x17 rectangle at position (22, 226).
; PLAN: r0=22(x), r1=226(y), r2=102(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 226
LDI r2, 102
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
