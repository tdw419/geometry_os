; DESCRIPTION: Places a red 58x110 rectangle at position (392, 34).
; PLAN: r0=392(x), r1=34(y), r2=58(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 34
LDI r2, 58
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
