; DESCRIPTION: Draws a cyan line from (146, 190) to (340, 38).
; PLAN: r0=146(x1), r1=190(y1), r2=340(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 190
LDI r2, 340
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
