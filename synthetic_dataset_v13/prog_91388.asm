; DESCRIPTION: Composite: Places a green dot at position (116, 42) then Draws a magenta line from (210, 143) to (149, 26).
; PLAN: r0=116(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=210(x1), r6=143(y1), r7=149(x2), r8=26(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 143
LDI r7, 149
LDI r8, 26
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
