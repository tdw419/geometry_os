; DESCRIPTION: Composite: Places a blue 98x63 rectangle at position (264, 154) then Renders a blue line between points (421, 200) and (64, 180).
; PLAN: r0=264(x), r1=154(y), r2=98(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=200(y1), r7=64(x2), r8=180(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 154
LDI r2, 98
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 200
LDI r7, 64
LDI r8, 180
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
