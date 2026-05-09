; DESCRIPTION: Places a red 85x40 rectangle at position (416, 22).
; PLAN: r0=416(x), r1=22(y), r2=85(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 22
LDI r2, 85
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
