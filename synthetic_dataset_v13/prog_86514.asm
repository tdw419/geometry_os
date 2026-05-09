; DESCRIPTION: Places a black 47x68 rectangle at position (236, 13).
; PLAN: r0=236(x), r1=13(y), r2=47(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 13
LDI r2, 47
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
