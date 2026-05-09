; DESCRIPTION: Places a yellow 102x13 rectangle at position (237, 79).
; PLAN: r0=237(x), r1=79(y), r2=102(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 79
LDI r2, 102
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
