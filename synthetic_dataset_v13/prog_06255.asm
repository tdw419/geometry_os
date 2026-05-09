; DESCRIPTION: Places a black 99x85 rectangle at position (395, 54).
; PLAN: r0=395(x), r1=54(y), r2=99(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 54
LDI r2, 99
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
