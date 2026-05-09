; DESCRIPTION: Composite: Draws a blue line from (260, 152) to (306, 82) then Places a cyan 17x58 rectangle at position (71, 86).
; PLAN: r0=260(x1), r1=152(y1), r2=306(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=86(y), r7=17(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 152
LDI r2, 306
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 86
LDI r7, 17
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
