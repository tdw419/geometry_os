; DESCRIPTION: Places a black 72x120 rectangle at position (39, 26).
; PLAN: r0=39(x), r1=26(y), r2=72(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 26
LDI r2, 72
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
