; DESCRIPTION: Composite: Creates a magenta circular shape at (182, 127) with radius 76 then Draws a cyan line from (91, 152) to (192, 243).
; PLAN: r0=182(x), r1=127(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x1), r6=152(y1), r7=192(x2), r8=243(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 127
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 152
LDI r7, 192
LDI r8, 243
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
