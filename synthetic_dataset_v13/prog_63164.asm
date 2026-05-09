; DESCRIPTION: Places a yellow 52x29 rectangle at position (322, 21).
; PLAN: r0=322(x), r1=21(y), r2=52(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 21
LDI r2, 52
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
