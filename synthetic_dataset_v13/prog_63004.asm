; DESCRIPTION: Renders a cyan line between points (449, 242) and (75, 219).
; PLAN: r0=449(x1), r1=242(y1), r2=75(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 242
LDI r2, 75
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
