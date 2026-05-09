; DESCRIPTION: Composite: Places a orange circle of radius 26 at center (46, 214) then Draws a black line from (399, 242) to (262, 168) then Sets a single cyan pixel at (360, 206).
; PLAN: r0=46(x), r1=214(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x1), r6=242(y1), r7=262(x2), r8=168(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=206(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 214
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 242
LDI r7, 262
LDI r8, 168
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 206
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
