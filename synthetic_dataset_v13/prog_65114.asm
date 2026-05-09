; DESCRIPTION: Places a cyan line segment connecting (218, 152) to (179, 231).
; PLAN: r0=218(x1), r1=152(y1), r2=179(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 152
LDI r2, 179
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
