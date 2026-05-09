; DESCRIPTION: Composite: Places a green dot at position (354, 95) then Renders a black line between points (446, 187) and (420, 182).
; PLAN: r0=354(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=187(y1), r7=420(x2), r8=182(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 446
LDI r6, 187
LDI r7, 420
LDI r8, 182
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
