; DESCRIPTION: Draws a cyan line from (125, 242) to (185, 126).
; PLAN: r0=125(x1), r1=242(y1), r2=185(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 242
LDI r2, 185
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
