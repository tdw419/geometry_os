; DESCRIPTION: Places a black 55x84 rectangle at position (346, 7).
; PLAN: r0=346(x), r1=7(y), r2=55(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 7
LDI r2, 55
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
