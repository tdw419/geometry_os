; DESCRIPTION: Composite: Creates a white rectangular region at (103, 45) spanning 120 by 104 pixels then Renders a magenta line between points (504, 162) and (331, 179).
; PLAN: r0=103(x), r1=45(y), r2=120(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=162(y1), r7=331(x2), r8=179(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 45
LDI r2, 120
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 162
LDI r7, 331
LDI r8, 179
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
