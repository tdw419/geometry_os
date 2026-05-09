; DESCRIPTION: Places a yellow 102x29 rectangle at position (33, 168).
; PLAN: r0=33(x), r1=168(y), r2=102(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 168
LDI r2, 102
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
