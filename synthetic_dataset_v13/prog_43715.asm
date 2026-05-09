; DESCRIPTION: Composite: Renders a purple line between points (389, 99) and (19, 228) then Places a green 46x116 rectangle at position (100, 31).
; PLAN: r0=389(x1), r1=99(y1), r2=19(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=31(y), r7=46(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 99
LDI r2, 19
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 31
LDI r7, 46
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
