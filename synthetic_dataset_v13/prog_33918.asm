; DESCRIPTION: Composite: Places a blue 44x40 rectangle at position (243, 93) then Places a cyan line segment connecting (84, 112) to (159, 239).
; PLAN: r0=243(x), r1=93(y), r2=44(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=112(y1), r7=159(x2), r8=239(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 93
LDI r2, 44
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 112
LDI r7, 159
LDI r8, 239
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
