; DESCRIPTION: Places a green 29x21 rectangle at position (325, 221).
; PLAN: r0=325(x), r1=221(y), r2=29(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 221
LDI r2, 29
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
