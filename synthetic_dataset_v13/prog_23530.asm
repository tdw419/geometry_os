; DESCRIPTION: Places a yellow 47x68 rectangle at position (0, 29).
; PLAN: r0=0(x), r1=29(y), r2=47(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 29
LDI r2, 47
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
