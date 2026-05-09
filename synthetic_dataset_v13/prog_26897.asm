; DESCRIPTION: Creates a green rectangular region at (262, 22) spanning 113 by 109 pixels.
; PLAN: r0=262(x), r1=22(y), r2=113(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 22
LDI r2, 113
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
