; DESCRIPTION: Places a white 91x88 rectangle at position (222, 54).
; PLAN: r0=222(x), r1=54(y), r2=91(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 54
LDI r2, 91
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
