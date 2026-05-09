; DESCRIPTION: Places a purple 64x91 rectangle at position (433, 21).
; PLAN: r0=433(x), r1=21(y), r2=64(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 21
LDI r2, 64
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
