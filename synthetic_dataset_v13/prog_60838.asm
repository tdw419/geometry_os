; DESCRIPTION: Places a yellow 83x32 rectangle at position (56, 169).
; PLAN: r0=56(x), r1=169(y), r2=83(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 169
LDI r2, 83
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
