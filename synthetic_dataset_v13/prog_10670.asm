; DESCRIPTION: Places a green 91x39 rectangle at position (325, 144).
; PLAN: r0=325(x), r1=144(y), r2=91(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 144
LDI r2, 91
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
