; DESCRIPTION: Composite: Draws a magenta line from (385, 149) to (86, 124) then Renders a cyan disk with center (154, 179) and radius 30.
; PLAN: r0=385(x1), r1=149(y1), r2=86(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=179(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 385
LDI r1, 149
LDI r2, 86
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 179
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
