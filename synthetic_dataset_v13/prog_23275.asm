; DESCRIPTION: Draws a cyan line from (198, 39) to (187, 80).
; PLAN: r0=198(x1), r1=39(y1), r2=187(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 39
LDI r2, 187
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
