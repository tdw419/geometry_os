; DESCRIPTION: Places a yellow 32x33 rectangle at position (123, 208).
; PLAN: r0=123(x), r1=208(y), r2=32(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 208
LDI r2, 32
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
