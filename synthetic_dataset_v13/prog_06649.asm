; DESCRIPTION: Places a yellow 68x50 rectangle at position (138, 152).
; PLAN: r0=138(x), r1=152(y), r2=68(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 152
LDI r2, 68
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
