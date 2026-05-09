; DESCRIPTION: Places a yellow 98x87 rectangle at position (250, 2).
; PLAN: r0=250(x), r1=2(y), r2=98(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 2
LDI r2, 98
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
