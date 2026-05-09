; DESCRIPTION: Renders a cyan line between points (498, 149) and (32, 132).
; PLAN: r0=498(x1), r1=149(y1), r2=32(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 149
LDI r2, 32
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
