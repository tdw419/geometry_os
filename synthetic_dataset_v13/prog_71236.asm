; DESCRIPTION: Draws a cyan line from (402, 215) to (77, 174).
; PLAN: r0=402(x1), r1=215(y1), r2=77(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 215
LDI r2, 77
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
