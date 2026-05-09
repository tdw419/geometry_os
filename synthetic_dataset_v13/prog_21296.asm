; DESCRIPTION: Creates a green rectangular region at (277, 143) spanning 93 by 69 pixels.
; PLAN: r0=277(x), r1=143(y), r2=93(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 143
LDI r2, 93
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
