; DESCRIPTION: Composite: Renders a black disk with center (345, 161) and radius 57 then Renders a green box of size 54x92 starting at (226, 134).
; PLAN: r0=345(x), r1=161(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=134(y), r7=54(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 161
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 134
LDI r7, 54
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
