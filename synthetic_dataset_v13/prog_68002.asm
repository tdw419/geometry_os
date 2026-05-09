; DESCRIPTION: Composite: Renders a magenta disk with center (317, 229) and radius 10 then Sets a single cyan pixel at (314, 40) then Renders a green box of size 31x86 starting at (473, 31).
; PLAN: r0=317(x), r1=229(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=40(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=473(x), r11=31(y), r12=31(width), r13=86(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 229
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 40
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 473
LDI r11, 31
LDI r12, 31
LDI r13, 86
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
