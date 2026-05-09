; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (265, 82) then Places a yellow dot at position (164, 67) then Places a yellow line segment connecting (402, 103) to (258, 223).
; PLAN: r0=265(x), r1=82(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=67(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=103(y1), r12=258(x2), r13=223(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 82
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 67
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 402
LDI r11, 103
LDI r12, 258
LDI r13, 223
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
