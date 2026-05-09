; DESCRIPTION: Places a green 10x112 rectangle at position (385, 55).
; PLAN: r0=385(x), r1=55(y), r2=10(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 55
LDI r2, 10
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
