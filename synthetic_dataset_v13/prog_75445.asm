; DESCRIPTION: Composite: Places a yellow dot at position (54, 120) then Places a white 102x61 rectangle at position (361, 91) then Places a purple line segment connecting (124, 16) to (422, 207).
; PLAN: r0=54(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=91(y), r7=102(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x1), r11=16(y1), r12=422(x2), r13=207(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 361
LDI r6, 91
LDI r7, 102
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 16
LDI r12, 422
LDI r13, 207
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
