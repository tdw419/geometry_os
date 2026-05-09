; DESCRIPTION: Places a cyan 58x11 rectangle at position (441, 160).
; PLAN: r0=441(x), r1=160(y), r2=58(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 160
LDI r2, 58
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
