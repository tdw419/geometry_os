; DESCRIPTION: Renders a green box of size 33x53 starting at (186, 175).
; PLAN: r0=186(x), r1=175(y), r2=33(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 175
LDI r2, 33
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
