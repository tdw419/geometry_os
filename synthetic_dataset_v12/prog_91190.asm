; DESCRIPTION: Places a yellow 16x35 rectangle at position (34, 37).
; PLAN: r0=34(x), r1=37(y), r2=16(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 37
LDI r2, 16
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
