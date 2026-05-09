; DESCRIPTION: Draws a cyan line from (230, 193) to (263, 86).
; PLAN: r0=230(x1), r1=193(y1), r2=263(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 193
LDI r2, 263
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
