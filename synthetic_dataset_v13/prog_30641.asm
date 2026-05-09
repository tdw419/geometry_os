; DESCRIPTION: Places a yellow 92x17 rectangle at position (230, 133).
; PLAN: r0=230(x), r1=133(y), r2=92(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 133
LDI r2, 92
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
