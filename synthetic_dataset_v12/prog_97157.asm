; DESCRIPTION: Places a cyan line segment connecting (197, 215) to (106, 174).
; PLAN: r0=197(x1), r1=215(y1), r2=106(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 215
LDI r2, 106
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
