; DESCRIPTION: Draws a cyan line from (123, 152) to (333, 192).
; PLAN: r0=123(x1), r1=152(y1), r2=333(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 152
LDI r2, 333
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
