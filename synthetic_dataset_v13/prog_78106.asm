; DESCRIPTION: Renders a blue box of size 31x86 starting at (175, 33).
; PLAN: r0=175(x), r1=33(y), r2=31(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 33
LDI r2, 31
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
