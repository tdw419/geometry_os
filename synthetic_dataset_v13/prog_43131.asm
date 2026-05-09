; DESCRIPTION: Places a yellow 11x36 rectangle at position (87, 169).
; PLAN: r0=87(x), r1=169(y), r2=11(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 11
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
