; DESCRIPTION: Places a black 72x102 rectangle at position (70, 48).
; PLAN: r0=70(x), r1=48(y), r2=72(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 48
LDI r2, 72
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
