; DESCRIPTION: Composite: Renders a cyan line between points (453, 56) and (426, 117) then Places a black 120x83 rectangle at position (349, 129) then Sets a single orange pixel at (135, 80).
; PLAN: r0=453(x1), r1=56(y1), r2=426(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=129(y), r7=120(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=80(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 56
LDI r2, 426
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 129
LDI r7, 120
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 80
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
