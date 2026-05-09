; DESCRIPTION: Draws a cyan line from (148, 101) to (295, 192).
; PLAN: r0=148(x1), r1=101(y1), r2=295(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 101
LDI r2, 295
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
