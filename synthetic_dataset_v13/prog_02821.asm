; DESCRIPTION: Composite: Places a magenta dot at position (337, 78) then Renders a blue line between points (346, 96) and (259, 153).
; PLAN: r0=337(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x1), r6=96(y1), r7=259(x2), r8=153(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 96
LDI r7, 259
LDI r8, 153
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
