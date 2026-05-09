; DESCRIPTION: Places a black 58x86 rectangle at position (145, 48).
; PLAN: r0=145(x), r1=48(y), r2=58(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 48
LDI r2, 58
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
