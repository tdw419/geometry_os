; DESCRIPTION: Places a yellow 45x87 rectangle at position (277, 137).
; PLAN: r0=277(x), r1=137(y), r2=45(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 137
LDI r2, 45
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
