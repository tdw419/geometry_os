; DESCRIPTION: Places a black 55x92 rectangle at position (242, 115).
; PLAN: r0=242(x), r1=115(y), r2=55(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 115
LDI r2, 55
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
