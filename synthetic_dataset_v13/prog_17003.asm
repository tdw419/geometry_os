; DESCRIPTION: Composite: Draws a purple line from (212, 46) to (360, 16) then Renders a cyan box of size 37x83 starting at (260, 13).
; PLAN: r0=212(x1), r1=46(y1), r2=360(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=13(y), r7=37(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 46
LDI r2, 360
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 13
LDI r7, 37
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
