; DESCRIPTION: Creates a yellow rectangular region at (277, 103) spanning 60 by 23 pixels.
; PLAN: r0=277(x), r1=103(y), r2=60(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 103
LDI r2, 60
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
