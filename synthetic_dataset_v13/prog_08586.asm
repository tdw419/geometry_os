; DESCRIPTION: Composite: Draws a cyan line from (55, 214) to (243, 141) then Renders a green disk with center (80, 190) and radius 42 then Places a magenta dot at position (32, 205).
; PLAN: r0=55(x1), r1=214(y1), r2=243(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=190(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=205(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 214
LDI r2, 243
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 190
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 205
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
