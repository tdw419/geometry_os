; DESCRIPTION: Creates a green rectangular region at (262, 146) spanning 16 by 102 pixels.
; PLAN: r0=262(x), r1=146(y), r2=16(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 146
LDI r2, 16
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
