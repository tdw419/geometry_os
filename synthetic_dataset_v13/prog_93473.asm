; DESCRIPTION: Places a yellow 101x117 rectangle at position (271, 47).
; PLAN: r0=271(x), r1=47(y), r2=101(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 47
LDI r2, 101
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
