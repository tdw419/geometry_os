; DESCRIPTION: Composite: Sets a single white pixel at (269, 220) then Renders a cyan line between points (154, 126) and (20, 182).
; PLAN: r0=269(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=126(y1), r7=20(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 126
LDI r7, 20
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
