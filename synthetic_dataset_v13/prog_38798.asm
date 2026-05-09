; DESCRIPTION: Creates a green rectangular region at (146, 179) spanning 24 by 43 pixels.
; PLAN: r0=146(x), r1=179(y), r2=24(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 179
LDI r2, 24
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
