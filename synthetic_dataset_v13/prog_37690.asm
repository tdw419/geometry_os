; DESCRIPTION: Composite: Renders a cyan line between points (294, 91) and (391, 90) then Places a magenta dot at position (474, 215).
; PLAN: r0=294(x1), r1=91(y1), r2=391(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=215(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 91
LDI r2, 391
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 215
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
