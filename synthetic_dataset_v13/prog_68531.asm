; DESCRIPTION: Composite: Places a green line segment connecting (242, 1) to (425, 43) then Places a green 120x23 rectangle at position (177, 33) then Places a blue circle of radius 71 at center (394, 142).
; PLAN: r0=242(x1), r1=1(y1), r2=425(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=33(y), r7=120(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=142(y), r12=71(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 1
LDI r2, 425
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 33
LDI r7, 120
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 142
LDI r12, 71
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
