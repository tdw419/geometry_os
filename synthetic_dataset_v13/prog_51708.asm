; DESCRIPTION: Places a yellow 28x47 rectangle at position (115, 22).
; PLAN: r0=115(x), r1=22(y), r2=28(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 22
LDI r2, 28
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
