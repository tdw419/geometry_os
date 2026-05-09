; DESCRIPTION: Composite: Renders a green line between points (18, 3) and (404, 112) then Renders a red box of size 92x107 starting at (322, 89).
; PLAN: r0=18(x1), r1=3(y1), r2=404(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=89(y), r7=92(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 3
LDI r2, 404
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 89
LDI r7, 92
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
