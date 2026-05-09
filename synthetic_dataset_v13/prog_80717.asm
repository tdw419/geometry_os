; DESCRIPTION: Creates a green rectangular region at (297, 223) spanning 117 by 10 pixels.
; PLAN: r0=297(x), r1=223(y), r2=117(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 223
LDI r2, 117
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
