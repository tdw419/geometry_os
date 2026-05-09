; DESCRIPTION: Places a orange 22x86 rectangle at position (245, 13).
; PLAN: r0=245(x), r1=13(y), r2=22(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 13
LDI r2, 22
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
