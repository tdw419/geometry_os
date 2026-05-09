; DESCRIPTION: Places a cyan 110x19 rectangle at position (237, 155).
; PLAN: r0=237(x), r1=155(y), r2=110(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 155
LDI r2, 110
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
