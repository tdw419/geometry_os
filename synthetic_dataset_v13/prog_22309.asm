; DESCRIPTION: Places a black 12x55 rectangle at position (112, 50).
; PLAN: r0=112(x), r1=50(y), r2=12(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 50
LDI r2, 12
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
