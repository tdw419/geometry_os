; DESCRIPTION: Composite: Creates a orange rectangular region at (27, 189) spanning 73 by 32 pixels then Places a orange line segment connecting (429, 127) to (177, 220) then Places a magenta dot at position (420, 154).
; PLAN: r0=27(x), r1=189(y), r2=73(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=127(y1), r7=177(x2), r8=220(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=154(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 27
LDI r1, 189
LDI r2, 73
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 127
LDI r7, 177
LDI r8, 220
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 154
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
