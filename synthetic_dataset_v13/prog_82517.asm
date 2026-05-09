; DESCRIPTION: Composite: Sets a single cyan pixel at (204, 226) then Renders a yellow line between points (206, 248) and (215, 188).
; PLAN: r0=204(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=248(y1), r7=215(x2), r8=188(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 248
LDI r7, 215
LDI r8, 188
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
