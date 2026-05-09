; DESCRIPTION: Composite: Places a red dot at position (73, 254) then Renders a cyan line between points (245, 226) and (46, 128).
; PLAN: r0=73(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=245(x1), r6=226(y1), r7=46(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 245
LDI r6, 226
LDI r7, 46
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
