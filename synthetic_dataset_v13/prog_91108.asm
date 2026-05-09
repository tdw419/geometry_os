; DESCRIPTION: Places a yellow 15x54 rectangle at position (237, 84).
; PLAN: r0=237(x), r1=84(y), r2=15(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 84
LDI r2, 15
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
