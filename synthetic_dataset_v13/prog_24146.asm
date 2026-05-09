; DESCRIPTION: Draws a cyan line from (71, 24) to (27, 231).
; PLAN: r0=71(x1), r1=24(y1), r2=27(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 24
LDI r2, 27
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
