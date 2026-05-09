; DESCRIPTION: Renders a white box of size 54x17 starting at (115, 186).
; PLAN: r0=115(x), r1=186(y), r2=54(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 186
LDI r2, 54
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
