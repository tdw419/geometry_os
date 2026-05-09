; DESCRIPTION: Places a black 63x14 rectangle at position (303, 192).
; PLAN: r0=303(x), r1=192(y), r2=63(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 192
LDI r2, 63
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
