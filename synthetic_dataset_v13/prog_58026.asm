; DESCRIPTION: Composite: Places a magenta 24x36 rectangle at position (145, 184) then Renders a yellow line between points (398, 213) and (466, 72).
; PLAN: r0=145(x), r1=184(y), r2=24(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x1), r6=213(y1), r7=466(x2), r8=72(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 184
LDI r2, 24
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 213
LDI r7, 466
LDI r8, 72
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
