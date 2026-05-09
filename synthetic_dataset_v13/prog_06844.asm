; DESCRIPTION: Places a black 12x112 rectangle at position (462, 143).
; PLAN: r0=462(x), r1=143(y), r2=12(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 143
LDI r2, 12
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
