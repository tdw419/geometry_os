; DESCRIPTION: Renders a cyan line between points (4, 229) and (429, 242).
; PLAN: r0=4(x1), r1=229(y1), r2=429(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 229
LDI r2, 429
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
