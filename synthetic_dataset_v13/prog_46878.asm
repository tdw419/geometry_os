; DESCRIPTION: Places a red 34x110 rectangle at position (344, 65).
; PLAN: r0=344(x), r1=65(y), r2=34(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 65
LDI r2, 34
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
