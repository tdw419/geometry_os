; DESCRIPTION: Places a black 112x45 rectangle at position (21, 157).
; PLAN: r0=21(x), r1=157(y), r2=112(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 157
LDI r2, 112
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
