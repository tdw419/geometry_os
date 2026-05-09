; DESCRIPTION: Creates a green rectangular region at (277, 131) spanning 76 by 72 pixels.
; PLAN: r0=277(x), r1=131(y), r2=76(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 131
LDI r2, 76
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
