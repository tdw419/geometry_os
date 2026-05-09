; DESCRIPTION: Composite: Renders a black line between points (328, 82) and (485, 47) then Places a blue 78x63 rectangle at position (302, 188).
; PLAN: r0=328(x1), r1=82(y1), r2=485(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=188(y), r7=78(width), r8=63(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 82
LDI r2, 485
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 188
LDI r7, 78
LDI r8, 63
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
