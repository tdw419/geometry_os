; DESCRIPTION: Places a yellow 67x32 rectangle at position (361, 145).
; PLAN: r0=361(x), r1=145(y), r2=67(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 145
LDI r2, 67
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
