; DESCRIPTION: Composite: Renders a green disk with center (289, 93) and radius 20 then Renders a white line between points (304, 159) and (305, 189) then Renders a cyan box of size 47x11 starting at (247, 185).
; PLAN: r0=289(x), r1=93(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=159(y1), r7=305(x2), r8=189(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=185(y), r12=47(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 93
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 159
LDI r7, 305
LDI r8, 189
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 185
LDI r12, 47
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
