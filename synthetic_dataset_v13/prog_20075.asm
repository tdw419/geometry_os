; DESCRIPTION: Composite: Places a red line segment connecting (392, 244) to (489, 192) then Places a cyan 67x46 rectangle at position (289, 157).
; PLAN: r0=392(x1), r1=244(y1), r2=489(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=157(y), r7=67(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 244
LDI r2, 489
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 157
LDI r7, 67
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
