; DESCRIPTION: Composite: Places a red line segment connecting (374, 215) to (493, 112) then Renders a orange box of size 84x56 starting at (277, 81).
; PLAN: r0=374(x1), r1=215(y1), r2=493(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=81(y), r7=84(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 215
LDI r2, 493
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 81
LDI r7, 84
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
