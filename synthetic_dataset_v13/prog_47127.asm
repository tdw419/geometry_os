; DESCRIPTION: Composite: Renders a yellow line between points (351, 182) and (422, 249) then Places a cyan 12x69 rectangle at position (312, 35).
; PLAN: r0=351(x1), r1=182(y1), r2=422(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=35(y), r7=12(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 182
LDI r2, 422
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 35
LDI r7, 12
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
