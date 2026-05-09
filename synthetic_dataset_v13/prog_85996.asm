; DESCRIPTION: Places a cyan 120x58 rectangle at position (169, 78).
; PLAN: r0=169(x), r1=78(y), r2=120(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 78
LDI r2, 120
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
