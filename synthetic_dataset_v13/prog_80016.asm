; DESCRIPTION: Composite: Sets a single orange pixel at (253, 120) then Draws a cyan line from (168, 52) to (463, 21) then Renders a blue box of size 111x81 starting at (85, 26).
; PLAN: r0=253(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=168(x1), r6=52(y1), r7=463(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=26(y), r12=111(width), r13=81(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 168
LDI r6, 52
LDI r7, 463
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 26
LDI r12, 111
LDI r13, 81
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
