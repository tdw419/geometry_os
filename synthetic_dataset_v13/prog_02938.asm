; DESCRIPTION: Places a purple 65x48 rectangle at position (176, 106).
; PLAN: r0=176(x), r1=106(y), r2=65(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 106
LDI r2, 65
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
