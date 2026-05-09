; DESCRIPTION: Places a yellow 103x80 rectangle at position (322, 131).
; PLAN: r0=322(x), r1=131(y), r2=103(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 131
LDI r2, 103
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
