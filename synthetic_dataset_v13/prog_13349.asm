; DESCRIPTION: Composite: Draws a red line from (50, 89) to (401, 119) then Renders a green disk with center (242, 64) and radius 56 then Sets a single purple pixel at (218, 111).
; PLAN: r0=50(x1), r1=89(y1), r2=401(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=64(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 89
LDI r2, 401
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 64
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
