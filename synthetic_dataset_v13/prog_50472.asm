; DESCRIPTION: Composite: Renders a magenta line between points (162, 147) and (8, 42) then Places a cyan 31x45 rectangle at position (480, 79).
; PLAN: r0=162(x1), r1=147(y1), r2=8(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=79(y), r7=31(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 147
LDI r2, 8
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 79
LDI r7, 31
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
