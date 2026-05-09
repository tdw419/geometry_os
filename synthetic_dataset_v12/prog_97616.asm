; DESCRIPTION: Places a yellow 93x54 rectangle at position (170, 152).
; PLAN: r0=170(x), r1=152(y), r2=93(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 152
LDI r2, 93
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
