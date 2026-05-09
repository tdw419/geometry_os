; DESCRIPTION: Places a green 28x57 rectangle at position (141, 160).
; PLAN: r0=141(x), r1=160(y), r2=28(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 160
LDI r2, 28
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
