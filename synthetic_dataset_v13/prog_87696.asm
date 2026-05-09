; DESCRIPTION: Places a yellow 12x86 rectangle at position (272, 61).
; PLAN: r0=272(x), r1=61(y), r2=12(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 61
LDI r2, 12
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
