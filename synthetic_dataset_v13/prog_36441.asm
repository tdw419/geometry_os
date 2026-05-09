; DESCRIPTION: Places a yellow 92x18 rectangle at position (412, 200).
; PLAN: r0=412(x), r1=200(y), r2=92(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 200
LDI r2, 92
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
