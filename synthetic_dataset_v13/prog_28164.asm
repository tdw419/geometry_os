; DESCRIPTION: Renders a white box of size 57x102 starting at (337, 152).
; PLAN: r0=337(x), r1=152(y), r2=57(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 152
LDI r2, 57
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
