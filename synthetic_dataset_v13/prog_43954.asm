; DESCRIPTION: Places a yellow 84x87 rectangle at position (287, 13).
; PLAN: r0=287(x), r1=13(y), r2=84(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 13
LDI r2, 84
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
