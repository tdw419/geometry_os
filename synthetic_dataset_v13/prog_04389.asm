; DESCRIPTION: Composite: Sets a single black pixel at (129, 113) then Renders a magenta line between points (182, 70) and (224, 243).
; PLAN: r0=129(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=182(x1), r6=70(y1), r7=224(x2), r8=243(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 70
LDI r7, 224
LDI r8, 243
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
