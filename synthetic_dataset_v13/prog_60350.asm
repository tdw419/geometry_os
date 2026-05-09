; DESCRIPTION: Places a yellow 18x37 rectangle at position (205, 208).
; PLAN: r0=205(x), r1=208(y), r2=18(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 208
LDI r2, 18
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
