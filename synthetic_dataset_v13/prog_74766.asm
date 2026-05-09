; DESCRIPTION: Composite: Renders a purple line between points (260, 70) and (57, 173) then Places a magenta 53x83 rectangle at position (253, 152).
; PLAN: r0=260(x1), r1=70(y1), r2=57(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=152(y), r7=53(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 70
LDI r2, 57
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 152
LDI r7, 53
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
