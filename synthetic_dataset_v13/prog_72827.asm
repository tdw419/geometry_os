; DESCRIPTION: Composite: Places a cyan circle of radius 48 at center (135, 58) then Renders a magenta line between points (115, 143) and (481, 40).
; PLAN: r0=135(x), r1=58(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=143(y1), r7=481(x2), r8=40(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 58
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 143
LDI r7, 481
LDI r8, 40
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
