; DESCRIPTION: Places a black 55x88 rectangle at position (279, 138).
; PLAN: r0=279(x), r1=138(y), r2=55(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 138
LDI r2, 55
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
