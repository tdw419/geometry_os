; DESCRIPTION: Places a green 32x44 rectangle at position (185, 77).
; PLAN: r0=185(x), r1=77(y), r2=32(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 77
LDI r2, 32
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
