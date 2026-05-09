; DESCRIPTION: Composite: Renders a yellow line between points (274, 209) and (402, 87) then Creates a cyan rectangular region at (307, 126) spanning 95 by 60 pixels then Places a green dot at position (50, 202).
; PLAN: r0=274(x1), r1=209(y1), r2=402(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=126(y), r7=95(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=202(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 209
LDI r2, 402
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 126
LDI r7, 95
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 202
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
