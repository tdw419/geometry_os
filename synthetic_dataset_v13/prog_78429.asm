; DESCRIPTION: Places a cyan 22x77 rectangle at position (402, 144).
; PLAN: r0=402(x), r1=144(y), r2=22(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 144
LDI r2, 22
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
