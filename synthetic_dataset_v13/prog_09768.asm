; DESCRIPTION: Composite: Renders a blue line between points (345, 79) and (156, 229) then Places a magenta 54x103 rectangle at position (24, 127).
; PLAN: r0=345(x1), r1=79(y1), r2=156(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=127(y), r7=54(width), r8=103(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 79
LDI r2, 156
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 127
LDI r7, 54
LDI r8, 103
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
