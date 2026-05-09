; DESCRIPTION: Places a cyan 31x52 rectangle at position (160, 132).
; PLAN: r0=160(x), r1=132(y), r2=31(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 132
LDI r2, 31
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
