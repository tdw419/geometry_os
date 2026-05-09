; DESCRIPTION: Draws a cyan line from (126, 24) to (266, 29).
; PLAN: r0=126(x1), r1=24(y1), r2=266(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 24
LDI r2, 266
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
