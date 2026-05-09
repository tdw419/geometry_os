; DESCRIPTION: Draws a cyan line from (482, 6) to (23, 59).
; PLAN: r0=482(x1), r1=6(y1), r2=23(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 6
LDI r2, 23
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
