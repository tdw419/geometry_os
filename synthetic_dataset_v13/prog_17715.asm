; DESCRIPTION: Draws a cyan line from (482, 160) to (455, 234).
; PLAN: r0=482(x1), r1=160(y1), r2=455(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 160
LDI r2, 455
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
