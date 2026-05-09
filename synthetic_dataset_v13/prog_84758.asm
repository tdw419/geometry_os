; DESCRIPTION: Draws a cyan line from (237, 139) to (217, 150).
; PLAN: r0=237(x1), r1=139(y1), r2=217(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 139
LDI r2, 217
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
