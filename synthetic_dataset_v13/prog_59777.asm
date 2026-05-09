; DESCRIPTION: Composite: Renders a blue line between points (496, 99) and (346, 76) then Renders a blue box of size 21x54 starting at (487, 142).
; PLAN: r0=496(x1), r1=99(y1), r2=346(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=142(y), r7=21(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 99
LDI r2, 346
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 142
LDI r7, 21
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
