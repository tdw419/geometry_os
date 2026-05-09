; DESCRIPTION: Places a yellow 35x95 rectangle at position (152, 9).
; PLAN: r0=152(x), r1=9(y), r2=35(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 9
LDI r2, 35
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
