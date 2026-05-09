; DESCRIPTION: Places a orange 112x115 rectangle at position (369, 137).
; PLAN: r0=369(x), r1=137(y), r2=112(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 137
LDI r2, 112
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
