; DESCRIPTION: Composite: Places a black 115x64 rectangle at position (18, 172) then Renders a purple line between points (433, 96) and (225, 46).
; PLAN: r0=18(x), r1=172(y), r2=115(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=96(y1), r7=225(x2), r8=46(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 172
LDI r2, 115
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 96
LDI r7, 225
LDI r8, 46
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
