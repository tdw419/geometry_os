; DESCRIPTION: Composite: Renders a yellow disk with center (135, 177) and radius 73 then Renders a cyan line between points (248, 163) and (92, 117) then Places a cyan dot at position (445, 171).
; PLAN: r0=135(x), r1=177(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x1), r6=163(y1), r7=92(x2), r8=117(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=171(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 177
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 163
LDI r7, 92
LDI r8, 117
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 171
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
