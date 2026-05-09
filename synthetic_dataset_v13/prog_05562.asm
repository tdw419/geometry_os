; DESCRIPTION: Renders a cyan line between points (258, 32) and (52, 126).
; PLAN: r0=258(x1), r1=32(y1), r2=52(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 32
LDI r2, 52
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
