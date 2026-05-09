; DESCRIPTION: Places a black 112x37 rectangle at position (120, 65).
; PLAN: r0=120(x), r1=65(y), r2=112(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 65
LDI r2, 112
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
