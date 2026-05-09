; DESCRIPTION: Places a yellow 79x86 rectangle at position (325, 157).
; PLAN: r0=325(x), r1=157(y), r2=79(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 157
LDI r2, 79
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
