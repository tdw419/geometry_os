; DESCRIPTION: Places a yellow 109x112 rectangle at position (218, 119).
; PLAN: r0=218(x), r1=119(y), r2=109(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 119
LDI r2, 109
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
