; DESCRIPTION: Places a black 55x96 rectangle at position (16, 130).
; PLAN: r0=16(x), r1=130(y), r2=55(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 130
LDI r2, 55
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
