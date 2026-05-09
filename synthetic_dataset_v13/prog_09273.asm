; DESCRIPTION: Composite: Places a orange line segment connecting (371, 215) to (282, 66) then Creates a yellow rectangular region at (196, 32) spanning 107 by 120 pixels.
; PLAN: r0=371(x1), r1=215(y1), r2=282(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=32(y), r7=107(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 215
LDI r2, 282
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 32
LDI r7, 107
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
