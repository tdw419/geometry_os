; DESCRIPTION: Composite: Renders a magenta line between points (37, 66) and (456, 152) then Places a black 38x47 rectangle at position (196, 198).
; PLAN: r0=37(x1), r1=66(y1), r2=456(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=198(y), r7=38(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 66
LDI r2, 456
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 198
LDI r7, 38
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
