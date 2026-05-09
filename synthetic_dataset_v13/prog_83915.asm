; DESCRIPTION: Draws a cyan line from (190, 237) to (482, 92).
; PLAN: r0=190(x1), r1=237(y1), r2=482(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 237
LDI r2, 482
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
