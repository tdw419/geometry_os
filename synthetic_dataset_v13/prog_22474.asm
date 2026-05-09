; DESCRIPTION: Renders a green box of size 66x66 starting at (197, 129).
; PLAN: r0=197(x), r1=129(y), r2=66(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 129
LDI r2, 66
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
