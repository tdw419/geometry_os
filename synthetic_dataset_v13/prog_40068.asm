; DESCRIPTION: Places a yellow 68x84 rectangle at position (418, 19).
; PLAN: r0=418(x), r1=19(y), r2=68(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 19
LDI r2, 68
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
