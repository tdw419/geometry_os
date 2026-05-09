; DESCRIPTION: Draws a cyan line from (509, 104) to (217, 146).
; PLAN: r0=509(x1), r1=104(y1), r2=217(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 104
LDI r2, 217
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
