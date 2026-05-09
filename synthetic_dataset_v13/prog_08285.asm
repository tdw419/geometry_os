; DESCRIPTION: Places a red 34x44 rectangle at position (344, 4).
; PLAN: r0=344(x), r1=4(y), r2=34(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 4
LDI r2, 34
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
