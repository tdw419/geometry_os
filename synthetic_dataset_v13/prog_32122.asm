; DESCRIPTION: Places a yellow 54x22 rectangle at position (237, 94).
; PLAN: r0=237(x), r1=94(y), r2=54(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 94
LDI r2, 54
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
