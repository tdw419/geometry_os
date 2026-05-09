; DESCRIPTION: Places a black 55x102 rectangle at position (114, 144).
; PLAN: r0=114(x), r1=144(y), r2=55(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 144
LDI r2, 55
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
