; DESCRIPTION: Composite: Places a magenta 44x50 rectangle at position (235, 74) then Places a blue line segment connecting (45, 112) to (260, 95).
; PLAN: r0=235(x), r1=74(y), r2=44(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=112(y1), r7=260(x2), r8=95(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 74
LDI r2, 44
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 112
LDI r7, 260
LDI r8, 95
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
