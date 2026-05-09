; DESCRIPTION: Places a orange 65x44 rectangle at position (416, 188).
; PLAN: r0=416(x), r1=188(y), r2=65(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 188
LDI r2, 65
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
