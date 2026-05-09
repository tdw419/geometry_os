; DESCRIPTION: Composite: Sets a single cyan pixel at (48, 179) then Draws a purple line from (269, 248) to (381, 128) then Renders a black box of size 106x10 starting at (97, 218).
; PLAN: r0=48(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=248(y1), r7=381(x2), r8=128(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=218(y), r12=106(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 248
LDI r7, 381
LDI r8, 128
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 218
LDI r12, 106
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
