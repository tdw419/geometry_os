; DESCRIPTION: Composite: Places a purple 29x82 rectangle at position (218, 100) then Places a green line segment connecting (260, 202) to (112, 40).
; PLAN: r0=218(x), r1=100(y), r2=29(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=202(y1), r7=112(x2), r8=40(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 100
LDI r2, 29
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 202
LDI r7, 112
LDI r8, 40
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
