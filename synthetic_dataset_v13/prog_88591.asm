; DESCRIPTION: Composite: Renders a yellow line between points (398, 107) and (176, 182) then Places a blue 33x21 rectangle at position (243, 110).
; PLAN: r0=398(x1), r1=107(y1), r2=176(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=110(y), r7=33(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 107
LDI r2, 176
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 110
LDI r7, 33
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
