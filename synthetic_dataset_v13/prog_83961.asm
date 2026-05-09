; DESCRIPTION: Composite: Places a red dot at position (453, 214) then Draws a cyan line from (298, 25) to (21, 177) then Draws a magenta circle centered at (292, 139) with radius 69.
; PLAN: r0=453(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=25(y1), r7=21(x2), r8=177(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=292(x), r11=139(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 25
LDI r7, 21
LDI r8, 177
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 139
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
