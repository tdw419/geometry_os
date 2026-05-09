; DESCRIPTION: Places a cyan 89x72 rectangle at position (160, 17).
; PLAN: r0=160(x), r1=17(y), r2=89(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 17
LDI r2, 89
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
