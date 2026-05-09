; DESCRIPTION: Renders a cyan line between points (126, 35) and (270, 213).
; PLAN: r0=126(x1), r1=35(y1), r2=270(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 35
LDI r2, 270
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
