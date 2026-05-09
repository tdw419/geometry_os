; DESCRIPTION: Places a green 29x34 rectangle at position (218, 44).
; PLAN: r0=218(x), r1=44(y), r2=29(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 44
LDI r2, 29
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
