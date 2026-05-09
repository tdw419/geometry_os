; DESCRIPTION: Creates a green rectangular region at (204, 120) spanning 81 by 45 pixels.
; PLAN: r0=204(x), r1=120(y), r2=81(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 120
LDI r2, 81
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
