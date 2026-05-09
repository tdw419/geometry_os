; DESCRIPTION: Renders a green box of size 104x80 starting at (277, 77).
; PLAN: r0=277(x), r1=77(y), r2=104(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 77
LDI r2, 104
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
