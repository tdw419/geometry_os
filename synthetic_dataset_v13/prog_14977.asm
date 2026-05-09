; DESCRIPTION: Renders a cyan line between points (367, 178) and (440, 25).
; PLAN: r0=367(x1), r1=178(y1), r2=440(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 178
LDI r2, 440
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
