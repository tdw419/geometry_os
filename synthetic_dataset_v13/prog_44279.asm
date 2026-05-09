; DESCRIPTION: Places a yellow 14x30 rectangle at position (347, 169).
; PLAN: r0=347(x), r1=169(y), r2=14(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 14
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
