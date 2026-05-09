; DESCRIPTION: Places a green 114x86 rectangle at position (130, 49).
; PLAN: r0=130(x), r1=49(y), r2=114(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 49
LDI r2, 114
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
