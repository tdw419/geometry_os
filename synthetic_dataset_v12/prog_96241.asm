; DESCRIPTION: Renders a white box of size 58x117 starting at (277, 98).
; PLAN: r0=277(x), r1=98(y), r2=58(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 98
LDI r2, 58
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
