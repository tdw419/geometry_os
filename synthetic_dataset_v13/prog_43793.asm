; DESCRIPTION: Composite: Renders a yellow line between points (197, 70) and (264, 112) then Places a purple 72x31 rectangle at position (161, 125).
; PLAN: r0=197(x1), r1=70(y1), r2=264(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=125(y), r7=72(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 70
LDI r2, 264
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 125
LDI r7, 72
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
