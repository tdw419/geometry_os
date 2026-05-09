; DESCRIPTION: Composite: Creates a black rectangular region at (30, 81) spanning 62 by 42 pixels then Draws a cyan line from (263, 215) to (132, 171) then Sets a single cyan pixel at (206, 206).
; PLAN: r0=30(x), r1=81(y), r2=62(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=215(y1), r7=132(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=206(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 81
LDI r2, 62
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 215
LDI r7, 132
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 206
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
