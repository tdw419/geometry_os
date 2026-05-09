; DESCRIPTION: Composite: Places a black dot at position (401, 54) then Renders a magenta line between points (231, 18) and (307, 227).
; PLAN: r0=401(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=231(x1), r6=18(y1), r7=307(x2), r8=227(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 54
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 18
LDI r7, 307
LDI r8, 227
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
