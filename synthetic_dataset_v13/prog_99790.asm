; DESCRIPTION: Places a purple 30x91 rectangle at position (160, 59).
; PLAN: r0=160(x), r1=59(y), r2=30(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 59
LDI r2, 30
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
