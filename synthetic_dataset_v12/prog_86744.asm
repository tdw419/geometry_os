; DESCRIPTION: Composite: Places a magenta dot at position (461, 238) then Renders a white line between points (406, 103) and (242, 131).
; PLAN: r0=461(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=103(y1), r7=242(x2), r8=131(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 103
LDI r7, 242
LDI r8, 131
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
