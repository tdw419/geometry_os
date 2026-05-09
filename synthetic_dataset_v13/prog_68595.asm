; DESCRIPTION: Composite: Draws a cyan line from (457, 47) to (87, 157) then Places a magenta circle of radius 68 at center (186, 150).
; PLAN: r0=457(x1), r1=47(y1), r2=87(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=150(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 47
LDI r2, 87
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 150
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
