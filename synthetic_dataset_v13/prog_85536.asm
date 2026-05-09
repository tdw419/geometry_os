; DESCRIPTION: Composite: Places a white 40x45 rectangle at position (213, 189) then Places a purple dot at position (414, 229) then Places a white line segment connecting (327, 167) to (434, 201).
; PLAN: r0=213(x), r1=189(y), r2=40(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=229(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=327(x1), r11=167(y1), r12=434(x2), r13=201(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 189
LDI r2, 40
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 229
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 167
LDI r12, 434
LDI r13, 201
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
