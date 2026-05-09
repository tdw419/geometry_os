; DESCRIPTION: Renders a cyan line between points (433, 236) and (126, 196).
; PLAN: r0=433(x1), r1=236(y1), r2=126(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 236
LDI r2, 126
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
