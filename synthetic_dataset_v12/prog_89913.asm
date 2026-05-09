; DESCRIPTION: Composite: Places a blue 75x73 rectangle at position (210, 10) then Renders a orange line between points (92, 21) and (331, 153).
; PLAN: r0=210(x), r1=10(y), r2=75(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=21(y1), r7=331(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 10
LDI r2, 75
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 21
LDI r7, 331
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
