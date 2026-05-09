; DESCRIPTION: Renders a cyan line between points (61, 18) and (440, 196).
; PLAN: r0=61(x1), r1=18(y1), r2=440(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 18
LDI r2, 440
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
