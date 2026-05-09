; DESCRIPTION: Draws a cyan line from (45, 249) to (417, 132).
; PLAN: r0=45(x1), r1=249(y1), r2=417(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 249
LDI r2, 417
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
