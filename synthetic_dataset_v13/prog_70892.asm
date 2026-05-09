; DESCRIPTION: Places a green 83x59 rectangle at position (199, 133).
; PLAN: r0=199(x), r1=133(y), r2=83(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 133
LDI r2, 83
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
