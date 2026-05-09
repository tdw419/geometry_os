; DESCRIPTION: Draws a cyan line from (271, 193) to (504, 183).
; PLAN: r0=271(x1), r1=193(y1), r2=504(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 193
LDI r2, 504
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
