; DESCRIPTION: Draws a cyan line from (312, 245) to (509, 209).
; PLAN: r0=312(x1), r1=245(y1), r2=509(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 245
LDI r2, 509
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
