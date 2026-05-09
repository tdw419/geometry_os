; DESCRIPTION: Renders a green box of size 116x87 starting at (370, 104).
; PLAN: r0=370(x), r1=104(y), r2=116(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 104
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
