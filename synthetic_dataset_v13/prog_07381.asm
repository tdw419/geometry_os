; DESCRIPTION: Places a cyan 58x54 rectangle at position (325, 59).
; PLAN: r0=325(x), r1=59(y), r2=58(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 59
LDI r2, 58
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
