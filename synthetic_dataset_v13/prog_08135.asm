; DESCRIPTION: Composite: Draws a magenta line from (76, 218) to (110, 32) then Renders a red box of size 18x51 starting at (307, 0).
; PLAN: r0=76(x1), r1=218(y1), r2=110(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=0(y), r7=18(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 218
LDI r2, 110
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 0
LDI r7, 18
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
