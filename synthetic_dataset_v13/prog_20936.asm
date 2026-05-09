; DESCRIPTION: Composite: Renders a red line between points (120, 133) and (400, 36) then Creates a red rectangular region at (346, 57) spanning 24 by 104 pixels.
; PLAN: r0=120(x1), r1=133(y1), r2=400(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=57(y), r7=24(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 133
LDI r2, 400
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 57
LDI r7, 24
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
