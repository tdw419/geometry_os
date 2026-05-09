; DESCRIPTION: Places a green 10x89 rectangle at position (303, 54).
; PLAN: r0=303(x), r1=54(y), r2=10(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 54
LDI r2, 10
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
