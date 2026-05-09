; DESCRIPTION: Places a purple 56x18 rectangle at position (369, 15).
; PLAN: r0=369(x), r1=15(y), r2=56(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 15
LDI r2, 56
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
