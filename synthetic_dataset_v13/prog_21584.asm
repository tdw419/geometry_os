; DESCRIPTION: Places a yellow 96x105 rectangle at position (273, 144).
; PLAN: r0=273(x), r1=144(y), r2=96(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 144
LDI r2, 96
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
