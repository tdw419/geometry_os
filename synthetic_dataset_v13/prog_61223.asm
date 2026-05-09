; DESCRIPTION: Composite: Places a magenta 120x12 rectangle at position (96, 8) then Places a magenta dot at position (391, 153) then Renders a cyan line between points (180, 85) and (112, 154).
; PLAN: r0=96(x), r1=8(y), r2=120(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=153(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=180(x1), r11=85(y1), r12=112(x2), r13=154(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 8
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 153
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 85
LDI r12, 112
LDI r13, 154
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
