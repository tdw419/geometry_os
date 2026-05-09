; DESCRIPTION: Places a cyan line segment connecting (324, 46) to (168, 143).
; PLAN: r0=324(x1), r1=46(y1), r2=168(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 46
LDI r2, 168
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
