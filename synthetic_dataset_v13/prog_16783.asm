; DESCRIPTION: Places a green 47x44 rectangle at position (318, 8).
; PLAN: r0=318(x), r1=8(y), r2=47(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 8
LDI r2, 47
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
