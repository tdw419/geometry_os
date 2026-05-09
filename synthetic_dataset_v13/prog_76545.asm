; DESCRIPTION: Draws a cyan line from (395, 127) to (482, 154).
; PLAN: r0=395(x1), r1=127(y1), r2=482(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 127
LDI r2, 482
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
