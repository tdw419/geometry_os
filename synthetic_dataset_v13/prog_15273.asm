; DESCRIPTION: Composite: Creates a yellow rectangular region at (57, 153) spanning 16 by 64 pixels then Places a red line segment connecting (236, 206) to (298, 245).
; PLAN: r0=57(x), r1=153(y), r2=16(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=206(y1), r7=298(x2), r8=245(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 153
LDI r2, 16
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 206
LDI r7, 298
LDI r8, 245
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
