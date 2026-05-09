; DESCRIPTION: Composite: Renders a yellow line between points (283, 120) and (169, 56) then Places a yellow 52x39 rectangle at position (189, 10).
; PLAN: r0=283(x1), r1=120(y1), r2=169(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=10(y), r7=52(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 120
LDI r2, 169
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 10
LDI r7, 52
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
