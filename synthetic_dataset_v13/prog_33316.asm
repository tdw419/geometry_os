; DESCRIPTION: Places a green 90x73 rectangle at position (392, 160).
; PLAN: r0=392(x), r1=160(y), r2=90(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 160
LDI r2, 90
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
