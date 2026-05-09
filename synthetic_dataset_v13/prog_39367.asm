; DESCRIPTION: Places a black 37x60 rectangle at position (392, 189).
; PLAN: r0=392(x), r1=189(y), r2=37(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 189
LDI r2, 37
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
