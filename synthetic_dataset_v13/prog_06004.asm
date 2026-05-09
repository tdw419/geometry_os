; DESCRIPTION: Composite: Places a red dot at position (393, 135) then Draws a yellow line from (305, 98) to (168, 212).
; PLAN: r0=393(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=98(y1), r7=168(x2), r8=212(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 305
LDI r6, 98
LDI r7, 168
LDI r8, 212
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
