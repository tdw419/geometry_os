; DESCRIPTION: Composite: Places a blue dot at position (375, 154) then Renders a magenta line between points (269, 66) and (191, 210).
; PLAN: r0=375(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=66(y1), r7=191(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 66
LDI r7, 191
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
