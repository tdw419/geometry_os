; DESCRIPTION: Composite: Creates a cyan rectangular region at (124, 104) spanning 103 by 12 pixels then Draws a green line from (415, 78) to (459, 27).
; PLAN: r0=124(x), r1=104(y), r2=103(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=78(y1), r7=459(x2), r8=27(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 104
LDI r2, 103
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 78
LDI r7, 459
LDI r8, 27
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
