; DESCRIPTION: Composite: Renders a purple line between points (454, 215) and (26, 173) then Creates a black rectangular region at (73, 204) spanning 16 by 21 pixels.
; PLAN: r0=454(x1), r1=215(y1), r2=26(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=204(y), r7=16(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 215
LDI r2, 26
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 204
LDI r7, 16
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
