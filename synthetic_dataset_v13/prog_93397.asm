; DESCRIPTION: Places a yellow 95x17 rectangle at position (322, 4).
; PLAN: r0=322(x), r1=4(y), r2=95(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 4
LDI r2, 95
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
