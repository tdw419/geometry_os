; DESCRIPTION: Places a green 83x11 rectangle at position (266, 234).
; PLAN: r0=266(x), r1=234(y), r2=83(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 234
LDI r2, 83
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
