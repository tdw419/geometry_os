; DESCRIPTION: Places a yellow 91x22 rectangle at position (48, 83).
; PLAN: r0=48(x), r1=83(y), r2=91(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 83
LDI r2, 91
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
