; DESCRIPTION: Places a yellow 101x66 rectangle at position (335, 86).
; PLAN: r0=335(x), r1=86(y), r2=101(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 86
LDI r2, 101
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
