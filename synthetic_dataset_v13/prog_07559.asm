; DESCRIPTION: Composite: Places a green dot at position (379, 115) then Renders a yellow line between points (237, 1) and (135, 8).
; PLAN: r0=379(x), r1=115(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=1(y1), r7=135(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 115
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 1
LDI r7, 135
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
