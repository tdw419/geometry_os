; DESCRIPTION: Composite: Renders a green line between points (408, 138) and (412, 147) then Places a white 119x28 rectangle at position (115, 73).
; PLAN: r0=408(x1), r1=138(y1), r2=412(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=73(y), r7=119(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 138
LDI r2, 412
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 73
LDI r7, 119
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
