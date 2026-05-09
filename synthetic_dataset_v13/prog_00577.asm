; DESCRIPTION: Renders a cyan line between points (270, 98) and (392, 86).
; PLAN: r0=270(x1), r1=98(y1), r2=392(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 98
LDI r2, 392
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
