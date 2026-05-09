; DESCRIPTION: Places a purple 83x91 rectangle at position (160, 45).
; PLAN: r0=160(x), r1=45(y), r2=83(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 45
LDI r2, 83
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
