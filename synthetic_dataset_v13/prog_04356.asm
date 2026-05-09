; DESCRIPTION: Composite: Renders a orange box of size 112x98 starting at (226, 152) then Renders a green line between points (357, 196) and (356, 181).
; PLAN: r0=226(x), r1=152(y), r2=112(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x1), r6=196(y1), r7=356(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 152
LDI r2, 112
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 196
LDI r7, 356
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
