; DESCRIPTION: Places a cyan 95x110 rectangle at position (169, 106).
; PLAN: r0=169(x), r1=106(y), r2=95(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 106
LDI r2, 95
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
