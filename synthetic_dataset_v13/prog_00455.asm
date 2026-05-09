; DESCRIPTION: Renders a cyan line between points (439, 79) and (100, 242).
; PLAN: r0=439(x1), r1=79(y1), r2=100(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 79
LDI r2, 100
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
