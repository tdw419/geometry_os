; DESCRIPTION: Composite: Places a green 34x104 rectangle at position (439, 33) then Renders a red line between points (322, 164) and (408, 187).
; PLAN: r0=439(x), r1=33(y), r2=34(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=164(y1), r7=408(x2), r8=187(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 33
LDI r2, 34
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 164
LDI r7, 408
LDI r8, 187
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
