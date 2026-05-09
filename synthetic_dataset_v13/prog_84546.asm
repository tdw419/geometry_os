; DESCRIPTION: Composite: Places a green line segment connecting (165, 238) to (181, 191) then Renders a black box of size 85x86 starting at (33, 6).
; PLAN: r0=165(x1), r1=238(y1), r2=181(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=6(y), r7=85(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 238
LDI r2, 181
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 6
LDI r7, 85
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
