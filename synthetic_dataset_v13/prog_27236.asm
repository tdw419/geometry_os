; DESCRIPTION: Draws a cyan line from (352, 129) to (391, 220).
; PLAN: r0=352(x1), r1=129(y1), r2=391(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 129
LDI r2, 391
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
