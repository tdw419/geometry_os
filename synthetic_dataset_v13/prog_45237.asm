; DESCRIPTION: Places a green 44x19 rectangle at position (417, 59).
; PLAN: r0=417(x), r1=59(y), r2=44(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 59
LDI r2, 44
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
