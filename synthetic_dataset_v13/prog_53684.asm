; DESCRIPTION: Places a yellow 102x103 rectangle at position (259, 142).
; PLAN: r0=259(x), r1=142(y), r2=102(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 142
LDI r2, 102
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
