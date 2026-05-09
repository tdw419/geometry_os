; DESCRIPTION: Places a black 62x45 rectangle at position (392, 147).
; PLAN: r0=392(x), r1=147(y), r2=62(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 147
LDI r2, 62
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
