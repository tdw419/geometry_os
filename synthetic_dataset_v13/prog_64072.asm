; DESCRIPTION: Places a yellow 83x48 rectangle at position (424, 153).
; PLAN: r0=424(x), r1=153(y), r2=83(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 153
LDI r2, 83
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
