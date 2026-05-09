; DESCRIPTION: Places a green 44x72 rectangle at position (237, 9).
; PLAN: r0=237(x), r1=9(y), r2=44(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 9
LDI r2, 44
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
